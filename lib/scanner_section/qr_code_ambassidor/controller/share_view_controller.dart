import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class LinkController extends GetxController {
  // Observable string
  var generatedLink = ''.obs;

  void generateLink() {
    // Set your dynamically generated link here
    generatedLink.value = 'https://efgeywgfd_ef'; 
  }

  void copyLink() {
    if (generatedLink.value.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: generatedLink.value));
      // Show a quick snackbar using GetX
      Get.snackbar(
        "Copied",
        "Link copied to clipboard",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void shareLink() {
    if (generatedLink.value.isNotEmpty) {
      Share.share(generatedLink.value);
    }
  }
}