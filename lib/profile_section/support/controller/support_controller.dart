import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportController extends GetxController {
  // Observables (State)
  var name = ''.obs;
  var email = ''.obs;
  var message = ''.obs;
  var captchaToken = RxnString();
  var isVerifying = false.obs;

  // Methods to update state
  void updateName(String value) => name.value = value;
  void updateEmail(String value) => email.value = value;
  void updateMessage(String value) => message.value = value;

  void updateCaptcha(String token) {
    captchaToken.value = token;
    isVerifying.value = false;
  }

  void startCaptcha() => isVerifying.value = true;

  // Form Submission
  void submitForm() {
    if (name.value.isEmpty ||
        email.value.isEmpty ||
        message.value.isEmpty ||
        captchaToken.value == null) {
      Get.snackbar(
        "Notice",
        "Please complete all fields and verify captcha.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        colorText: Colors.white,
      );
      return;
    }

    Get.snackbar(
      "Success",
      "Message sent successfully!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}