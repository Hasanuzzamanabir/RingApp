
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:orange/core/utils/constants/app_colors.dart';
import 'package:orange/core/utils/constants/custom_text.dart';
import 'package:orange/core/widgets/custom_button_widget.dart';

import '../../routes/app_routes.dart';

class LimitedCreditDialog extends StatelessWidget {
  const LimitedCreditDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding:  EdgeInsets.symmetric(horizontal: 24.w),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.close, color: Colors.black),
              ),
            ),
            SizedBox(height: 35.h),
            CustomText(text: "You have 20 text credits remaining!",fontSize: 16.sp,color: AppColors.readColor,),
            SizedBox(height: 16.h),
            Text(
              "Once you reach zero credits you will not be \nable to send messages",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24.h),
            
            CustomButtonWidget(title: "Purchase Credits",onTap: (){
             Get.toNamed(AppRoute.purchaseTextCreditsScreen);
            },),
            SizedBox(height: 34.h),

          ],
        ),
      ),
    );
  }
}
