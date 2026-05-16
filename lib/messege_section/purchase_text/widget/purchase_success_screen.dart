import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/image_path.dart';
import 'package:orange/core/widgets/custom_image_background.dart';

class PurchaseSuccessScreen extends StatelessWidget {
  const PurchaseSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundImageScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
          child: Column(
            children: [
              CustomBackButtonwidget(onTap: () => Get.back()),
              SizedBox(height: 162.h),
              Column(
                children: [
                  Image.asset(ImagePath.purchaseSuccessImage, height: 80.h, width: 80.w),
                  SizedBox(height: 12.h),
                  Text("Payment Successful!", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
                  SizedBox(height: 6.h),
                  Text("Credits have been added to your account", 
                    style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}