import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:orange/core/network/services/api_services.dart';
import 'package:orange/core/token/token_storage.dart';
import 'package:orange/scanner_section/qr_code_ambassidor/model/ambassador_booking_model.dart';
import 'package:share_plus/share_plus.dart';


class LinkController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  Rxn<AmbassadorBookingModel> bookingData = Rxn<AmbassadorBookingModel>();
  RxString qrImageUrl = ''.obs;
  RxString accessToken = ''.obs;
  
  var generatedLink = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAmbassadorData();
  }

  Future<void> fetchAmbassadorData() async {
    try {
      isLoading.value = true;

      final token = await TokenStorage.getAccessToken();
      if (token != null) {
        accessToken.value = token;
      }

      qrImageUrl.value = 'https://clashingly-nonlicensable-tennille.ngrok-free.dev/api/auth/ambassador/me/qr/';

      final bookingResponse = await _apiServices.get(
        '/api/auth/ambassador/booking/',
        requireAuth: true,
      );

      log("Booking Status Code: ${bookingResponse.statusCode}");
      log("Booking Response Data: ${bookingResponse.data}");

      if (bookingResponse.statusCode == 200 && bookingResponse.data != null) {
        bookingData.value = AmbassadorBookingModel.fromJson(bookingResponse.data);
        
        if (bookingData.value?.ambassadorLink != null && bookingData.value!.ambassadorLink!.isNotEmpty) {
          generatedLink.value = bookingData.value!.ambassadorLink!;
        }
      }
    } catch (e) {
      log("Error fetching ambassador data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void generateLink() {
    if (bookingData.value?.ambassadorLink != null && bookingData.value!.ambassadorLink!.isNotEmpty) {
      generatedLink.value = bookingData.value!.ambassadorLink!;
    }
  }

  void copyLink() {
    if (generatedLink.value.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: generatedLink.value));
      Get.snackbar(
        "Copied",
        "Link copied to clipboard",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        "Notice",
        "No link available to copy yet",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void shareLink() {
    if (generatedLink.value.isNotEmpty) {
      Share.share(generatedLink.value);
    } else {
      Get.snackbar(
        "Notice",
        "No link available to share yet",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}