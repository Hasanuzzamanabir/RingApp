
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orange/core/utils/constants/custom_text.dart';
import 'package:orange/core/widgets/custom_button_widget.dart';
import 'package:orange/core/widgets/custom_text_form_field.dart';
import 'package:orange/profile_section/manage_account/manage_account/controller/update_password_controler.dart';

class UpdatePasswordDialog extends StatelessWidget {
  UpdatePasswordDialog({super.key});

  final _updatePasswordFormKey = GlobalKey<FormState>();
  
  // Controller initialize
  final controller = Get.put(UpdatePasswordController());

  // FocusNodes (UI behavior এর জন্য)
  final FocusNode _presentPasswordFocusNode = FocusNode();
  final FocusNode _newPasswordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _updatePasswordFormKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Change Password",
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.close, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  "Password must contain 1 caps letter, 1 symbol and length 12 characters",
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff746B6B),
                  ),
                ),
                SizedBox(height: 17.h),

                /// Present Password
                CustomText(text: "Present Password", fontSize: 13.sp, color: const Color(0xff575757)),
                SizedBox(height: 8.h),
                Obx(() => CustomTextField(
                  hintText: " * * * * * * * * ",
                  obscureText: !controller.isPresentVisible.value,
                  value: controller.presentPassword.value,
                  onChanged: controller.setPresentPassword,
                  //validator: AppValidator.validatePassword,
                  focusNode: _presentPasswordFocusNode,
                  // CustomTextField এ যদি suffixIcon প্যারামিটার না থাকে তবে আগের মেসেজ অনুযায়ী আপডেট করে নিন
                  // suffixIcon: IconButton(
                  //   icon: Icon(controller.isPresentVisible.value ? Icons.visibility : Icons.visibility_off),
                  //   onPressed: controller.togglePresentVisibility,
                  // ),
                )),

                SizedBox(height: 8.h),
                /// New Password
                CustomText(text: "New Password", fontSize: 13.sp, color: const Color(0xff575757)),
                SizedBox(height: 8.h),
                Obx(() => CustomTextField(
                  hintText: " * * * * * * * * ",
                  obscureText: !controller.isNewVisible.value,
                  value: controller.newPassword.value,
                  onChanged: controller.setNewPassword,
                  //validator: AppValidator.validatePassword,
                  focusNode: _newPasswordFocusNode,
                  // suffixIcon: IconButton(
                  //   icon: Icon(controller.isNewVisible.value ? Icons.visibility : Icons.visibility_off),
                  //   onPressed: controller.toggleNewVisibility,
                  // ),
                )),

                SizedBox(height: 8.h),
                /// Confirm Password
                CustomText(text: "Confirm Password", fontSize: 13.sp, color: const Color(0xff575757)),
                SizedBox(height: 8.h),
                Obx(() => CustomTextField(
                  hintText: " * * * * * * * * ",
                  obscureText: !controller.isConfirmVisible.value,
                  value: controller.confirmPassword.value,
                  onChanged: controller.setConfirmPassword,
                  validator: (value) {
                    if (value != controller.newPassword.value) {
                      return "New Password and Confirm Password doesn't match";
                    }
                    return null;
                  },
                  focusNode: _confirmPasswordFocusNode,
                  // suffixIcon: IconButton(
                  //   icon: Icon(controller.isConfirmVisible.value ? Icons.visibility : Icons.visibility_off),
                  //   onPressed: controller.toggleConfirmVisibility,
                  // ),
                )),

                SizedBox(height: 24.h),
                CustomButtonWidget(
                  title: "Submit New Password",
                  onTap: () {
                    if (_updatePasswordFormKey.currentState!.validate()) {
                      Get.back();
                    }
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