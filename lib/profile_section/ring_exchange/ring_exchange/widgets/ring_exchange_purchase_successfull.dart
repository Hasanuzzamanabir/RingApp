
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/image_path.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/routes/app_routes.dart';

class RingExchangePurchaseSuccessScreen extends StatelessWidget {
  const RingExchangePurchaseSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundImageScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
          child: Column(
            children: [
             CustomBackButtonwidget(
                onTap: () => Get.back(),
              ),
              SizedBox(height: 122.h),
              Column(
                children: [
                  Image.asset(ImagePath.purchaseSuccessImage, height: 80.h, width: 80.w),
                  SizedBox(height: 12.h),
                  Text(
                    "Ring Exchange Paid!",
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: const Color(0xff22C55E)),
                  ),
                  SizedBox(height: 6.h),
                  Text("Send your ring for exchange to:", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400)),
                  SizedBox(height: 17.h),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.ringExchangePurchaseUnSuccessScreen);
                    },
                    child: Center(
                      child: Text(
                        "AmoreRings.com\n18300 South Halsted Street\nSuite B271\nGlenwood, Illinois  60425",
                        maxLines: 4,
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Exchanges are not issued until we receive your original ring, so be sure to get a tracking number for the package you send to us. ",
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}