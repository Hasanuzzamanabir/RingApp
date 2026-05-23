import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orange/core/network/services/api_services.dart';
import 'package:url_launcher/url_launcher.dart';

class SpecialEventController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  
  var videoUrl = "".obs;
  var isLoading = false.obs;

  static const String _specialEventEndpoint = '/api/auth/special-event/';

  @override
  void onInit() {
    super.onInit();
    fetchSpecialEvent();
  }

  Future<void> fetchSpecialEvent() async {
    try {
      isLoading.value = true;
      final response = await _apiServices.get(
        _specialEventEndpoint,
        requireAuth: true,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        videoUrl.value = data['special_event'] ?? "";
        log("SpecialEventController: Video URL loaded -> ${videoUrl.value}");
      }
    } catch (e) {
      log("Error fetching special event: $e");
    } finally {
      isLoading.value = false;
    }
  }

Future<void> launchVideoUrl() async {
    if (videoUrl.value.isEmpty) {
      Get.snackbar(
        "Link Not Available", 
        "Special event video link is not found yet.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.amber.withOpacity(0.8),
        colorText: Colors.black,
      );
      return;
    }

    final Uri url = Uri.parse(videoUrl.value);
    try {
      await launchUrl(
        url, 
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      log("Error launching URL: $e");
      try {
        await launchUrl(
          url,
          mode: LaunchMode.platformDefault,
        );
      } catch (innerError) {
        log("Fallback launching failed: $innerError");
        Get.snackbar(
          "Error", 
          "Cannot open the video link.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white,
        );
      }
    }
  }
}