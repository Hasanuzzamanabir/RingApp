import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orange/core/utils/constants/custom_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/icon_path.dart';

class CustomQRCodeButtonWidget extends StatelessWidget {
  const CustomQRCodeButtonWidget({
    super.key, 
    required this.title, 
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1.w, color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              // Using black with low opacity for a visible shadow on white background
              color: Colors.black.withOpacity(0.05), 
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              IconPath.qrIcon,
              height: 20.h,
              width: 20.w,
            ),
            CustomText(
              text: title,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.readColor,
            ),
            Icon(
              Icons.keyboard_arrow_right_sharp,
              size: 23,
              color: AppColors.readColor,
            ),
          ],
        ),
      ),
    );
  }
}