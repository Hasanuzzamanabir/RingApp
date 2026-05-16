import 'package:get/get.dart';

class DateRangeState {
  final DateTime? selectedDate;
  final DateTime start;
  final DateTime end;
  final bool isAllDay;

  DateRangeState({
    this.selectedDate,
    required this.start,
    required this.end,
    this.isAllDay = false,
  });

  DateRangeState copyWith({
    DateTime? selectedDate,
    DateTime? start,
    DateTime? end,
    bool? isAllDay,
  }) {
    return DateRangeState(
      selectedDate: selectedDate ?? this.selectedDate,
      start: start ?? this.start,
      end: end ?? this.end,
      isAllDay: isAllDay ?? this.isAllDay,
    );
  }
}

class DateRangeController extends GetxController {
  // Observable state
  final _state = DateRangeState(
    selectedDate: DateTime.now(),
    start: DateTime.now(),
    end: DateTime.now().add(const Duration(hours: 2)),
  ).obs;

  DateRangeState get state => _state.value;

  void selectDate(DateTime date) {
    _state.value = _state.value.copyWith(selectedDate: date);
  }

  void toggleAllDay(bool value) {
    _state.value = _state.value.copyWith(isAllDay: value);
  }

  void setStart(DateTime date) {
    _state.value = _state.value.copyWith(start: date);
  }

  void setEnd(DateTime date) {
    _state.value = _state.value.copyWith(end: date);
  }

  void clear() {
    _state.value = DateRangeState(
      selectedDate: null,
      start: DateTime.now(),
      end: DateTime.now(),
    );
  }

  void setToday() {
    selectDate(DateTime.now());
  }
}