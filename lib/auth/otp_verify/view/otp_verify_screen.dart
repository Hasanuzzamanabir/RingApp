import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/auth/otp_verify/widgets/pin_input_field.dart';

import 'package:orange/core/utils/constants/app_colors.dart';
import 'package:orange/core/utils/constants/custom_text.dart';
import 'package:orange/core/utils/constants/image_path.dart';

import 'package:orange/core/widgets/custom_button_widget.dart';
import 'package:orange/core/widgets/custom_image_background.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImageScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 38.h),

              /// Top Row
              Row(
                children: [
                  CustomBackButtonwidget(),

                  SizedBox(width: 114.w),

                  Image.asset(
                    ImagePath.amoreImage,
                    width: 75.w,
                    height: 22.h,
                  ),
                ],
              ),

              SizedBox(height: 190.h),

              /// Title
              CustomText(
                text: "Member Verification",
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.readColor,
              ),

              SizedBox(height: 21.h),

              /// Subtitle
              CustomText(
                text:
                    "We sent your one time pin to\nThis OTP will expire in 10 minutes.",
                textAlign: TextAlign.center,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.readColor,
              ),

              SizedBox(height: 35.h),

              /// OTP Input
              OtpInputField(
                onChanged: (value) {
                  // print(value);
                },
              ),

              SizedBox(height: 50.h),

              /// Continue Button
              CustomButtonWidget(
                title: "Continue",
                onTap: () {
                  Get.toNamed('/BottomNavBarScreen'); 
                },
              ),

              SizedBox(height: 18.h),

              /// Resend OTP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Didn’t get the code? ",
                  ),

                  CustomText(
                    text: "Resend OTP",
                    color: AppColors.readColor,
                    fontWeight: FontWeight.w600,
                    //fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.readColor,
                  ),
                ],
              ),

              SizedBox(height: 160.h),
            ],
          ),
        ),
      ),
    );
  }
}