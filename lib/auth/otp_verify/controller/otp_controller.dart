
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orange/core/network/services/api_services.dart';
import 'package:orange/core/token/token_storage.dart';

class OtpController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  
  String otpCode = ''; 
  
  var isLoading = false.obs;
  var isResending = false.obs;
  String userEmail = '';
  static const String _verifyOtpEndpoint = '/api/auth/verify-otp/';
  static const String _resendOtpEndpoint = '/api/auth/resend-otp/';

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments['email'] != null) {
      userEmail = Get.arguments['email'].toString();
      log("OtpController: Received email argument -> $userEmail");
    } else {
      log("WARNING: No email argument received in OtpController!");
    }
  }

  Future<void> verifyOtp() async {
    final otp = otpCode.trim();

    log("OtpController: Submitting OTP -> '$otp' for email: $userEmail");

    if (otp.isEmpty) {
      Get.snackbar(
        "Invalid OTP", 
        "Please enter the one-time pin sent to your email",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;

      final response = await _apiServices.post(
        _verifyOtpEndpoint,
        data: {
          "email": userEmail,
          "otp": otp,
        },
        requireAuth: false,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final accessToken = response.data['access']?.toString();

        if (accessToken != null && accessToken.isNotEmpty) {
          await TokenStorage.saveAccessToken(accessToken);
          log("Access token saved successfully. User is authenticated.");

          Get.offAllNamed('/BottomNavBarScreen'); 
        } else {
          throw Exception("Access token key not found in server response");
        }
      }
    } catch (e) {
      log("Error in verifyOtp: $e");
      Get.snackbar(
        "Verification Failed",
        "Invalid OTP or the pin has expired. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> resendOtp() async {
    if (userEmail.isEmpty) {
      Get.snackbar("Error", "Email not found. Please try again.");
      return;
    }

    try {
      isResending.value = true;
      
      final response = await _apiServices.post(
        _resendOtpEndpoint,
        data: {"email": userEmail},
        requireAuth: false,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          "OTP Resent",
          "A new one-time pin has been sent to your email.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      log("Error in resendOtp: $e");
      Get.snackbar(
        "Resend Failed",
        "Failed to resend OTP. Please try again later.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      isResending.value = false;
    }
  }
}
