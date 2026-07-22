import 'dart:developer';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:orange/core/network/services/api_services.dart';
import 'package:orange/scanner_section/ambasidor/model/ambassador_slot_model.dart';

class SchedulerController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxList<AmbassadorSlotModel> timeSlots = <AmbassadorSlotModel>[].obs;
  Rxn<AmbassadorSlotModel> selectedSlot = Rxn<AmbassadorSlotModel>();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAvailableSlots(selectedDate.value);
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
    selectedSlot.value = null;
    fetchAvailableSlots(date);
  }

  Future<void> fetchAvailableSlots(DateTime date) async {
    try {
      isLoading.value = true;
      timeSlots.clear();

      final String formattedDate = DateFormat('yyyy-MM-dd').format(date);
      log("Fetching Slots for Date: $formattedDate");

      final response = await _apiServices.get(
        '/api/auth/ambassador/slots/?date=$formattedDate',
        requireAuth: true,
      );

      log("Slots Response Status: ${response.statusCode}");
      log("Slots Response Data: ${response.data}");

      if (response.statusCode == 200 && response.data != null) {
        final List data = response.data;
        final parsedList = data.map((e) => AmbassadorSlotModel.fromJson(e)).toList();
        
        timeSlots.assignAll(parsedList);
        log("Parsed Slots Count: ${timeSlots.length}");
      }
    } catch (e) {
      log("Error fetching ambassador slots: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void selectSlot(AmbassadorSlotModel slot) {
    selectedSlot.value = slot;
  }

  void clearSelection() {
    selectedSlot.value = null;
  }

  String formatSlotTime(DateTime start, DateTime end) {
    final startStr = DateFormat('h:mm a').format(start.toLocal());
    final endStr = DateFormat('h:mm a').format(end.toLocal());
    return "$startStr - $endStr";
  }
}