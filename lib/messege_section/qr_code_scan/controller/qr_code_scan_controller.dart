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

  void onDetect(BarcodeCapture barcodeCapture) {
    if (isScanned.value) return;

    final barcode = barcodeCapture.barcodes.first;
    final String? qrText = barcode.rawValue;

    isScanned.value = true;
    debugPrint("SCANNED QR: $qrText");

    Get.back(result: qrText);
  }

  @override
  void onClose() {
    animationController.dispose();
    mobileController.dispose();
    super.onClose();
  }
}