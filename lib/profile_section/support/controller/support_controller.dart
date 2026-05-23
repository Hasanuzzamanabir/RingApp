// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SupportController extends GetxController {
//   // Observables (State)
//   var name = ''.obs;
//   var email = ''.obs;
//   var message = ''.obs;
//   var captchaToken = RxnString();
//   var isVerifying = false.obs;

//   // Methods to update state
//   void updateName(String value) => name.value = value;
//   void updateEmail(String value) => email.value = value;
//   void updateMessage(String value) => message.value = value;

//   void updateCaptcha(String token) {
//     captchaToken.value = token;
//     isVerifying.value = false;
//   }

//   void startCaptcha() => isVerifying.value = true;

//   // Form Submission
//   void submitForm() {
//     if (name.value.isEmpty ||
//         email.value.isEmpty ||
//         message.value.isEmpty ||
//         captchaToken.value == null) {
//       Get.snackbar(
//         "Notice",
//         "Please complete all fields and verify captcha.",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.black87,
//         colorText: Colors.white,
//       );
//       return;
//     }

//     Get.snackbar(
//       "Success",
//       "Message sent successfully!",
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.green,
//       colorText: Colors.white,
//     );
//   }
// }
import 'dart:developer';
import 'package:flutter/material.dart';
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
    if (name.value.isEmpty || email.value.isEmpty || message.value.isEmpty) {
      Get.snackbar(
        "Validation Error",
        "All fields are required",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return;
    }

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
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      log("Error submitting support form: $e");
      Get.snackbar(
        "Submission Failed",
        "Something went wrong. Please try again later.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}