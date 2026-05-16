
import 'package:get/get.dart';
import 'package:intl/intl.dart';



class TimeSlot {
  final DateTime slotUtc;
  final String label;
  final bool available;

  TimeSlot({
    required this.slotUtc,
    required this.label,
    this.available = true,
  });
}

enum ScheduleStatus { initial, loading, ready }


final Map<String, Duration> tzOffsets = {
  'UTC': Duration(hours: 0),
  'US/Eastern': Duration(hours: -4),
  'US/Central': Duration(hours: -5),
  'US/Mountain': Duration(hours: -6),
  'US/Pacific': Duration(hours: -7),
  'Europe/London': Duration(hours: 1),
  'Asia/Dhaka': Duration(hours: 6),
  'Asia/Kolkata': Duration(hours: 5, minutes: 30),
};

/// ----------------- Controller -----------------

class SchedulerController extends GetxController {

  /// Selected Date
  Rx<DateTime> selectedDate = DateTime.now().obs;

  /// Time Slots
  RxList<TimeSlot> timeSlots = <TimeSlot>[].obs;

  /// Selected Timezone
  RxString timezone = 'UTC'.obs;

  /// Selected Slot
  Rxn<TimeSlot> selectedSlot = Rxn<TimeSlot>();

  /// Status
  Rx<ScheduleStatus> status = ScheduleStatus.initial.obs;

  @override
  void onInit() {
    super.onInit();
    _loadForDate(selectedDate.value);
  }

  /// ----------------- Helpers -----------------

  Duration _zoneOffset() {
    return tzOffsets[timezone.value] ?? Duration.zero;
  }

  /// ----------------- Public Methods -----------------

  void setTimezone(String key) {
    timezone.value = key;
    selectedSlot.value = null;

    _loadForDate(selectedDate.value);
  }

  void selectDate(DateTime date) {
    final normalized = DateTime(
      date.year,
      date.month,
      date.day,
    );

    selectedDate.value = normalized;
    selectedSlot.value = null;

    _loadForDate(normalized);
  }

  void selectSlot(TimeSlot slot) {
    selectedSlot.value = slot;
  }

  void clearSelection() {
    selectedSlot.value = null;
  }

  /// ----------------- Load Slots -----------------

  void _loadForDate(DateTime date) {
    status.value = ScheduleStatus.loading;

    timeSlots.clear();

    final slots = _generateSlotsForDate(date);

    timeSlots.assignAll(slots);

    status.value = ScheduleStatus.ready;
  }

  /// ----------------- Slot Generator -----------------

  List<TimeSlot> _generateSlotsForDate(DateTime dateLocal) {

    final offset = _zoneOffset();

    /// Current UTC Time
    final nowUtc = DateTime.now().toUtc();

    /// Current Time in Selected Zone
    final nowInZone = nowUtc.add(offset);

    final todayInZoneDate = DateTime(
      nowInZone.year,
      nowInZone.month,
      nowInZone.day,
    );

    final targetDateInZoneDate = DateTime(
      dateLocal.year,
      dateLocal.month,
      dateLocal.day,
    );

    /// Past Date হলে Empty
    if (targetDateInZoneDate.isBefore(todayInZoneDate)) {
      return [];
    }

    /// Today হলে
    if (targetDateInZoneDate.isAtSameMomentAs(todayInZoneDate)) {

      DateTime start = nowInZone.add(
        const Duration(minutes: 30),
      );

      final int m = start.minute;

      final int offsetMin = (m == 0)
          ? 0
          : (m <= 30 ? (30 - m) : (60 - m));

      start = start.add(
        Duration(minutes: offsetMin),
      );

      final slotUtc = start.toUtc();

      return _generateSequenceFromUtc(
        slotUtc,
        dateLocal,
        offset,
      );
    }

    /// Future Date হলে
    else {

      final baseUtc = DateTime.utc(
        dateLocal.year,
        dateLocal.month,
        dateLocal.day,
        0,
        30,
      ).subtract(offset);

      return _generateSequenceFromUtc(
        baseUtc,
        dateLocal,
        offset,
      );
    }
  }

  /// ----------------- Generate Sequence -----------------

  List<TimeSlot> _generateSequenceFromUtc(
    DateTime firstUtc,
    DateTime dateLocal,
    Duration offset,
  ) {

    final List<TimeSlot> res = [];

    final endOfDayZone = DateTime.utc(
      dateLocal.year,
      dateLocal.month,
      dateLocal.day,
      23,
      59,
    ).subtract(offset);

    DateTime curUtc = firstUtc;

    while (curUtc.isBefore(endOfDayZone)) {

      final slotInZone = curUtc.toUtc().add(offset);

      final label = DateFormat(
        'h:mma',
      ).format(slotInZone);

      res.add(
        TimeSlot(
          slotUtc: curUtc.toUtc(),
          label: label.toLowerCase(),
        ),
      );

      curUtc = curUtc.add(
        const Duration(minutes: 30),
      );
    }

    return res;
  }
}