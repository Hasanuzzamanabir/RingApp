import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; 
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/image_path.dart';
import 'package:orange/core/widgets/custom_button_widget.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/core/widgets/custom_text_form_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../controller/support_controller.dart'; 

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller Initialize
    final controller = Get.put(SupportController());

    return BackgroundImageScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
          child: SingleChildScrollView( // কিবোর্ড ওভারফ্লো এড়াতে সাহায্য করবে
            child: Column(
              children: [
                Row(
                  children: [
                 CustomBackButtonwidget(),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Reach Us Anytime",
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
                SizedBox(height: 30.h),
                Text(
                  "We aim to have a healthy and engaged community. Send us a message so that we can resolve any issue or answer any question you may have",
                  style: const TextStyle(color: Color(0xffB2A9AA)),
                ),
                SizedBox(height: 36.h),
                
                // Name Field
                CustomTextField(
                  hintText: "Full Name",
                  onChanged: controller.updateName,
                ),
                SizedBox(height: 25.h),
                
                // Email Field
                CustomTextField(
                  hintText: "Enter email",
                  onChanged: controller.updateEmail,
                ),
                SizedBox(height: 25.h),
                
                // Message Field
                CustomTextField(
                  hintText: "How can we help you?",
                  maxLine: 6,
                  onChanged: controller.updateMessage,
                ),
                SizedBox(height: 50.h),
                
                // Captcha Image
                Image.asset(ImagePath.captureImage, width: 290.w),
                SizedBox(height: 25.h),
                
                // Submit Button
                CustomButtonWidget(
                  title: "Submit",
                  onTap: () {
                    controller.submitForm();
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}