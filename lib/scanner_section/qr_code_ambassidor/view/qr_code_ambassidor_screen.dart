import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/app_colors.dart';
import 'package:orange/core/utils/constants/image_path.dart';
import 'package:orange/core/widgets/custom_button_widget.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/scanner_section/qr_code_ambassidor/controller/share_view_controller.dart';
import 'package:orange/scanner_section/qr_code_ambassidor/widget/share_view_widget.dart';


class QRCodeAmbassadorScreen extends StatelessWidget {
  const QRCodeAmbassadorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final controller = Get.put(LinkController());
    
    final type = Get.arguments?['type'];
    final bool isFundraiser = type == "fundraiser";

    return BackgroundImageScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
              child: Row(
                children: [
               CustomBackButtonwidget(),
                  Expanded(
                    child: Center(
                      child: Text(
                        isFundraiser
                          ? "John's Fundraiser QR Code"
                          : "My Brand Ambassador QR Code",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.readColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80.h),
            Image.asset(ImagePath.qrCodeImage, height: 230.h, width: 230.w),
            SizedBox(height: 20.h),
            Text(
              isFundraiser
                  ? "Scan our QR code to help raise funds with us"
                  : "Scan my QR code to shop Amore Rings with me",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
              ),
            ),
            SizedBox(height: 60.h),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: CustomButtonWidget(
                title: "Share QR Link",
                onTap: () {
                  controller.generateLink();
                  // Use Get.dialog instead of showDialog
                  Get.dialog(const ShareLinkDialog());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}