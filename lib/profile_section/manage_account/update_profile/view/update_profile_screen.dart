import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/app_colors.dart';
import 'package:orange/core/utils/constants/custom_text.dart';
import 'package:orange/core/widgets/custom_button_widget.dart';
import 'package:orange/core/widgets/custom_text_form_field.dart';
import 'package:orange/profile_section/profile/controller/profile_screen_controller.dart';
import 'package:orange/profile_section/profile_avatar_widget.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _nameTEController = TextEditingController();
  final controller = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    // স্ক্রিন ওপেন হওয়ার সময় কারেন্ট নাম টেক্সট ফিল্ডে সেট হবে
    _nameTEController.text = controller.username.value;
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ================= TOP BAR =================
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
                child: Row(
                  children: [
                    CustomBackButtonwidget(),
                    SizedBox(width: 85.w),
                    Text(
                      "Update Profile",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.readColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15.h),

              // ================= PROFILE AVATAR HEADER =================
              _header(controller),

              SizedBox(height: 30.h),

              // ================= INPUT FIELDS & BUTTON =================
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "User Name",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),

                    SizedBox(height: 10.h),

                    CustomTextField(
                      hintText: "Enter user name",
                      controller: _nameTEController,
                    ),

                    SizedBox(height: 60.h),

                    // লোর্ডিং এবং বাটন স্টেট হ্যান্ডেল করার জন্য Obx
                    Obx(() {
                      return CustomButtonWidget(
                        title: controller.isProfileLoading.value
                            ? "Updating..."
                            : "Update",
                        onTap: controller.isProfileLoading.value
                            ? null
                            : () async {
                                FocusScope.of(context).unfocus();

                                await controller.updateProfile(
                                  _nameTEController.text,
                                );
                              },
                      );
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(ProfileController controller) {
    return Container(
      height: 200.h,
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      padding: const EdgeInsets.all(35),
      decoration: BoxDecoration(
        color: const Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              // আপনার তৈরি করা profileAvatar উইজেট (লোকাল অবজেক্ট ও নেটওয়ার্ক অবজেক্ট অবএক্স দিয়ে হ্যান্ডেল করে)
              profileAvatar(controller, 70),

              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () async {
                    await controller.pickProfileImage();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}