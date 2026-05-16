import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // GetX ইমপোর্ট
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/app_colors.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/profile_section/ring_exchange/free_ring_exchange/view/controller/free_ring_exchange_controller.dart';
import 'package:orange/routes/app_routes.dart';
// আপনার প্রজেক্টের পাথ অনুযায়ী নিচের দুটি ইমপোর্ট চেক করে নিন
// import 'package:orange/route/routes_name.dart'; 
// import 'ring_free_exchange_controller.dart';

class RingFreeExchangeScreen extends StatelessWidget {
  const RingFreeExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // কন্ট্রোলার ইনজেকশন
    final controller = Get.put(RingFreeExchangeController());

    return BackgroundImageScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
          child: Column(
            children: [
              Row(
                children: [
                  const CustomBackButtonwidget(),
                  SizedBox(width: 75.w),
                  Text(
                    "Free Exchange",
                    style: TextStyle(
                      fontSize: 19.sp,
                      color: AppColors.readColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              GestureDetector(
                onTap: () {
              
                  Get.toNamed(AppRoute.ringExchangeScreen); 
                },
                child: Container(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 60.h, top: 30.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xffEF2D35).withOpacity(0.8),
                        const Color(0xffEF2D35).withOpacity(1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You have until 10-24-2025 to exchange your Amore Ring at no charge.",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textWhite,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Select your new ring size and then send the ring along with your registered email address to:",
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textWhite,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: Text(
                          "AmoreRings.com\n18300 South Halsted Street\nSuite B271\nGlenwood, Illinois  60425",
                          maxLines: 4,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textWhite,
                            overflow: TextOverflow.ellipsis,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "Exchanges are not issued until we receive your original ring, so be sure to get a tracking number for the package you send to us.",
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textWhite,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Feel free to email any exchange questions to:   ",
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textWhite,
                              ),
                            ),
                            TextSpan(
                              text: "exchanges@amorerings.com",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff3B82F6),
                                overflow: TextOverflow.ellipsis,
                                decoration: TextDecoration.underline,
                                decorationColor: const Color(0xff3B82F6),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => controller.launchEmail(), // কন্ট্রোলার মেথড কল
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}