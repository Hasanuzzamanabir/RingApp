
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:google_fonts/google_fonts.dart';
import 'package:orange/core/utils/constants/custom_text.dart';
import 'package:orange/core/utils/constants/icon_path.dart';
import 'package:orange/core/utils/constants/image_path.dart';
import 'package:orange/profile_section/member_status/view/member_status_screen.dart';
import 'package:orange/profile_section/profile/controller/profile_screen_controller.dart';
import 'package:orange/profile_section/refund/view/refund_screen.dart';
import 'package:orange/routes/app_routes.dart';

import '../../ring_exchange/free_ring_exchange/view/free_ring_exchane_screen.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the Controller
    final controller = Get.put(ProfileController());

    return Scaffold(
      body: Column(
        children: [
          // 🔹 Top Gradient Section
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 50.h, bottom: 10.h),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFEBEB), Colors.white],
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 10.h),

                // 🔹 Profile Picture with Camera Button
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    // Use Obx to rebuild when profileImage changes
                    Obx(() => CircleAvatar(
                      radius: 60,
                      backgroundImage: controller.profileImage.value != null
                          ? FileImage(controller.profileImage.value!)
                          : const AssetImage(ImagePath.profileImage) as ImageProvider,
                    )),
                    GestureDetector(
                      onTap: () => controller.pickProfileImage(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0xffD9D9D9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.black54,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                // 🔹 Username - Wrapped in Obx
                Obx(() => Text(
                  controller.username.value,
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                )),
              ],
            ),
          ),

          // 🔹 Menu Section
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF2F2F2),
              ),
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
              child: Column(
                children: [
                  _buildMenuItem(IconPath.manageAccountIcon, "Manage account", onTap: () {
                    Get.toNamed(AppRoute.manageAccountScreen);
                  }),
                  _buildMenuItem(IconPath.memberIcon, "Member Status", onTap: () {
                  Get.to(() => const MemberStatusScreen());
                  }),
                  _buildMenuItem(IconPath.specialEventIcon, "Special Event", onTap: () {
                   Get.toNamed(AppRoute.specialEventScreen);
                  }),
                  _buildMenuItem(IconPath.ringIcon, "Ring Exchange", onTap: () {
                  Get.to(() => const RingFreeExchangeScreen());
                  }),
                  _buildMenuItem(IconPath.refundIcon, "Refund", onTap: () {
                 Get.to(() => const RefundScreen());
                  }),
                  _buildMenuItem(IconPath.supportIcon, "Support", onTap: () {
                 Get.toNamed(AppRoute.supportScreen);
                  }),
                  _buildMenuItem(IconPath.memberIcon, "Log Out",
                  
                   onTap: () {
                    controller.logout();
                     Get.offAllNamed('/loginScreen', arguments: {
                       'isLogOutScreen': true,

                     });
                  },showArrow: false
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String icon, String title, {VoidCallback? onTap,bool showArrow = true}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.only(bottom: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(icon, height: 20.h, width: 20.w),
                SizedBox(width: 30.w),
                CustomText(text: title, fontSize: 14),
              ],
            ),
            showArrow ? const Icon(Icons.chevron_right, size: 24) : SizedBox.shrink(),
                
          ],
        ),
      ),
    );
  }
}