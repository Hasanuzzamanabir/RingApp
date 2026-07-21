// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class QRScannerController extends GetxController with GetSingleTickerProviderStateMixin {
//   late AnimationController animationController;
//   final MobileScannerController mobileController = MobileScannerController();
  
//   var isScanned = false.obs;
//   var flashOn = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat(reverse: true);
//   }

//   void toggleFlash() {
//     flashOn.value = !flashOn.value;
//     mobileController.toggleTorch();
//   }

//   void onDetect(BarcodeCapture barcodeCapture) {
//     if (isScanned.value) return;

//     final barcode = barcodeCapture.barcodes.first;
//     final String? qrText = barcode.rawValue;

//     isScanned.value = true;
//     debugPrint("SCANNED QR: $qrText");

//     Get.back(result: qrText);
//   }

//   @override
//   void onClose() {
//     animationController.dispose();
//     mobileController.dispose();
//     super.onClose();
//   }
  
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  final MobileScannerController mobileController = MobileScannerController();
  
  var isScanned = false.obs;
  var flashOn = false.obs;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  void toggleFlash() {
    flashOn.value = !flashOn.value;
    mobileController.toggleTorch();
  }

  Future<void> onDetect(BarcodeCapture barcodeCapture) async {
    if (isScanned.value) return;

    if (barcodeCapture.barcodes.isNotEmpty) {
      final barcode = barcodeCapture.barcodes.first;
      final String? qrText = barcode.rawValue;

      if (qrText != null && qrText.trim().isNotEmpty) {
        isScanned.value = true;
        debugPrint("SCANNED QR: $qrText");

        // ক্যামেরা স্ট্রিম আগে থামানো হচ্ছে যেন ক্যামেরা হার্ডওয়্যার ক্র্যাশ না করে
        try {
          await mobileController.stop();
        } catch (e) {
          debugPrint("Error stopping mobileController: $e");
        }

        Get.back(result: qrText);
      }
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    mobileController.dispose();
    super.onClose();
  }
}