import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:orange/core/utils/constants/image_path.dart';
import 'package:orange/scanner_section/qr_code_ambassidor/controller/share_view_controller.dart';

class ShareLinkDialog extends StatelessWidget {
  const ShareLinkDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // Find the existing controller
    final controller = Get.find<LinkController>();

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.all(20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.back(), // GetX version of Navigator.pop
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_ios_new, size: 15),
                    const SizedBox(width: 10),
                    Text("Share Link", style: TextStyle(fontSize: 12.sp)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(Icons.close, size: 15),
              )
            ],
          ),
          SizedBox(height: 20.h),
          Image.asset(ImagePath.purchaseSuccessImage, height: 70.h, width: 70.w),
          SizedBox(height: 10.h),
          Text(
            'Link Generated Successfully!',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Shareable Link',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xff84B3FF), width: 1),
                  ),
                  child: Obx(() => Text(
                        controller.generatedLink.value,
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )),
                ),
              ),
              SizedBox(width: 5.w),
              ElevatedButton(
                onPressed: () => controller.copyLink(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  side: const BorderSide(color: Color(0xff84B3FF)),
                ),
                child: Text("Copy", style: TextStyle(fontSize: 10.sp, color: Colors.black)),
              ),
              SizedBox(width: 5.w),
              ElevatedButton(
                onPressed: () => controller.shareLink(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffEC2028),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text("Share", style: TextStyle(fontSize: 13.sp, color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}