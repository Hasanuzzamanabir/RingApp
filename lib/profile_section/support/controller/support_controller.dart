

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orange/core/network/services/api_services.dart';

class SupportController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  var name = "".obs;
  var email = "".obs;
  var message = "".obs;
  var isLoading = false.obs;

  static const String _supportEndpoint = '/api/auth/support/';

  void updateName(String value) => name.value = value;
  void updateEmail(String value) => email.value = value;
  void updateMessage(String value) => message.value = value;

  Future<void> submitForm() async {
    try {
      isLoading.value = true;

      final response = await _apiServices.post(
        _supportEndpoint,
        data: {
          "full_name": name.value.trim(),
          "email": email.value.trim(),
          "how_can_i_help_you": message.value.trim(),
        },
        requireAuth: true,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.back();

        Get.snackbar(
          "Success",
          "Your message has been sent successfully",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green.withOpacity(0.9),
          colorText: Colors.white,
          margin: EdgeInsets.all(15.w),
        );
        
        name.value = "";
        email.value = "";
        message.value = "";
      }
    } catch (e) {
      log("Error submitting support form: $e");
      Get.snackbar(
        "Submission Failed",
        "Something went wrong. Please try again later.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.9),
        colorText: Colors.white,
        margin: EdgeInsets.all(15.w),
      );
    } finally {
      isLoading.value = false;
    }
  }
}