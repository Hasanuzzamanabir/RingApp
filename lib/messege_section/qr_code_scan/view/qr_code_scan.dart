import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/messege_section/qr_code_scan/controller/qr_code_scan_controller.dart';
import '../../../../../core/utils/constants/app_colors.dart';


class QRScannerScreen extends StatelessWidget {
  const QRScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QRScannerController());

    return BackgroundImageScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              /// --- HEADER ---
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                CustomBackButtonwidget(),
                  SizedBox(width: 55.w),
                  Text(
                    "Scan QR Code",
                    style: TextStyle(
                      fontSize: 21.sp,
                      color: AppColors.readColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              /// --- INSTRUCTIONS ---
              Text(
                "Align the QR code inside the frame to scan",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.h),

              /// --- SCANNER AREA ---
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// CAMERA FEED
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: MobileScanner(
                        controller: controller.mobileController,
                        onDetect: controller.onDetect,
                      ),
                    ),

                    /// DARK OVERLAY
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.35),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    /// SCANNER OVERLAY
                    _buildScannerOverlay(controller),

                    /// FLASH BUTTON
                    Positioned(
                      bottom: 20.h,
                      child: GestureDetector(
                        onTap: controller.toggleFlash,
                        child: Container(
                          padding: EdgeInsets.all(14.w),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                          child: Obx(() => Icon(
                                controller.flashOn.value ? Icons.flash_on : Icons.flash_off,
                                color: Colors.red.shade400,
                                size: 30,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 200.h),
            ],
          ),
        ),
      ),
    );
  }

  /// SCANNER OVERLAY WITH LINE ANIMATION
  Widget _buildScannerOverlay(QRScannerController controller) {
    return Container(
      height: 280.h,
      width: 280.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: controller.animationController,
            builder: (context, child) {
              return Positioned(
                top: 280.h * controller.animationController.value,
                left: 0,
                right: 0,
                child: Container(
                  height: 3,
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.red.withOpacity(0.2),
                        Colors.red,
                        Colors.red.withOpacity(0.2),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}