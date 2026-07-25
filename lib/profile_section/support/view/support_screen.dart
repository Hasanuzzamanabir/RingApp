
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; 
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/widgets/custom_button_widget.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/core/widgets/custom_text_form_field.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../controller/support_controller.dart'; 

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SupportController());
    final supportFormKey = GlobalKey<FormState>();

    return BackgroundImageScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
          child: SingleChildScrollView( 
            child: Form(
              key: supportFormKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      const CustomBackButtonwidget(),
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
                  
                  const Text(
                    "We aim to have a health and engaged community.  Send us a message so 	that we can resolve or answer any question you may have.",
                    style: TextStyle(color: Color(0xffB2A9AA)),
                  ),
                  SizedBox(height: 36.h),
                  
                  CustomTextField(
                    hintText: "First Name",
                    onChanged: controller.updateName,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Name cannot be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25.h),
                  
                  CustomTextField(
                    hintText: "Enter email",
                    onChanged: controller.updateEmail,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Email cannot be empty";
                      }
                      if (!GetUtils.isEmail(value.trim())) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25.h),
                  
                  CustomTextField(
                    hintText: "How can we help you?",
                    maxLine: 6,
                    onChanged: controller.updateMessage,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Message cannot be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 50.h),
                  
                  Obx(() {
                    return controller.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButtonWidget(
                            title: "Submit",
                            onTap: () {
                              if (supportFormKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                controller.submitForm();
                              }
                            },
                          );
                  }),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}