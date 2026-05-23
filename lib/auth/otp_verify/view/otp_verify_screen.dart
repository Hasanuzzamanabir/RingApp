import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; 
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/auth/otp_verify/controller/otp_controller.dart';
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
  final OtpController _otpController = Get.put(OtpController());

  
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
                  const CustomBackButtonwidget(),
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

              CustomText(
                text: "We sent your one time pin to\n${_otpController.userEmail}\nThis OTP will expire in 10 minutes.",
                textAlign: TextAlign.center,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.readColor,
              ),

              SizedBox(height: 35.h),

              /// OTP Input
              OtpInputField(
                onChanged: (value) {
                  _otpController.otpCode = value;
                },
              ),

              SizedBox(height: 50.h),

              /// Continue Button
              Obx(() {
                return CustomButtonWidget(
                  title: _otpController.isLoading.value ? "Verifying..." : "Continue",
                  onTap: _otpController.isLoading.value
                      ? null 
                      : () {
                          FocusScope.of(context).unfocus();
                          _otpController.verifyOtp();
                        },
                );
              }),

              SizedBox(height: 18.h),

              /// Resend OTP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Didn’t get the code? ",
                  ),
                  Obx(() {
                    return GestureDetector(
                      onTap: _otpController.isResending.value
                          ? null 
                          : () => _otpController.resendOtp(),
                      child: CustomText(
                        text: _otpController.isResending.value ? "Resending..." : "Resend OTP",
                        color: _otpController.isResending.value ? Colors.grey : AppColors.readColor,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.readColor,
                      ),
                    );
                  }),
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