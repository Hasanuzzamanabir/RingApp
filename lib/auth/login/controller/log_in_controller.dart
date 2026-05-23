import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orange/core/network/error/api_exception.dart';
import 'package:orange/core/network/services/api_services.dart';
import 'package:orange/routes/app_routes.dart';

class LoginController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final TextEditingController emailController = TextEditingController();
  var isLoading = false.obs;

  static const String _loginEndpoint = '/api/auth/login/';

  Future<void> sendOtp() async {
    final email = emailController.text.trim();

    try {
      isLoading.value = true;

      final response = await _apiServices.post(
        _loginEndpoint,
        data: {"email": email},
        requireAuth: false,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          "Success",
          "OTP sent to your email successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
        );
        
       
        Get.toNamed(AppRoute.otpverifyScreen, arguments: {"email": email}); 
      }
    } catch (e) {
      log("Error in sendOtp: $e");
      final errorMessage = e is ApiException ? e.message : e.toString().replaceFirst('Exception: ', '');
      Get.snackbar(
        "Error",
        errorMessage.isNotEmpty ? errorMessage : "Failed to send OTP. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}