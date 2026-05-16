import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/app_colors.dart';
import 'package:orange/core/utils/constants/image_path.dart';
import 'package:orange/core/widgets/custom_image_background.dart';

class PurchaseUnSuccessScreen extends StatelessWidget {
  const PurchaseUnSuccessScreen({super.key});

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
                  Image.asset(ImagePath.purchaseUnSuccessImage, height: 80.h, width: 80.w),
                  SizedBox(height: 12.h),
                  Text("Failed", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: AppColors.readColor)),
                  SizedBox(height: 6.h),
                  Text("Credits not added to your account", 
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