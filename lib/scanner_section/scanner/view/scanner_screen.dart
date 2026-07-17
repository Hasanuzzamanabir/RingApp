// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart'; // Import GetX

// import 'package:orange/core/utils/constants/custom_text.dart';
// import 'package:orange/core/utils/constants/image_path.dart';
// import 'package:orange/core/widgets/custom_image_background.dart';
// import 'package:orange/routes/app_routes.dart';
// import 'package:orange/scanner_section/scanner/widget/custom_qr_code_button_widget.dart';
// import '../../../../core/utils/constants/app_colors.dart';

// class ScannerScreen extends StatelessWidget {
//   const ScannerScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BackgroundImageScaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
//               child: Center(
//                 child: Text(
//                   "My QR Code",
//                   style: TextStyle(
//                     fontSize: 18.sp,
//                     color: AppColors.readColor,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 80.h),
//             Image.asset(
//               ImagePath.qrCodeImage,
//               height: 250.h,
//               width: 250.w,
//             ),
//             SizedBox(height: 10.h),
//             CustomText(
//               text: "Scan my QR code to message me",
//               color: AppColors.readColor,
//               fontSize: 12.sp,
//               fontWeight: FontWeight.w400,
//             ),
//             SizedBox(height: 72.h),
//             Padding(
//               padding: EdgeInsets.only(left: 15.w, right: 15.w),
//               child: Column(
//                 children: [
//                   CustomQRCodeButtonWidget(
//                     title: "Become a Brand Ambassador",
//                     onTap: () {
//                       Get.toNamed(
//                         AppRoute.ambassadorScreen,
//                         arguments: {'title': 'brand'},
//                       );
//                     },
//                   ),
//                   SizedBox(height: 20.h),
//                   CustomQRCodeButtonWidget(
//                     title: "Start a Fundraiser",
//                     onTap: () {
//                       Get.toNamed(
//                         AppRoute.ambassadorScreen,
//                         arguments: {'title': 'fundraiser'},
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orange/core/base_url/base_url.dart';
import 'package:orange/core/utils/constants/custom_text.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/routes/app_routes.dart';
import 'package:orange/scanner_section/scanner/widget/custom_qr_code_button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/constants/app_colors.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  Future<String> _getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token') ?? prefs.getString('token') ?? prefs.getString('access') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImageScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
              child: Center(
                child: Text(
                  "My QR Code",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.readColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(height: 80.h),
            FutureBuilder<String>(
              future: _getAccessToken(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: 250.h,
                    width: 250.w,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }

                final token = snapshot.data ?? '';
                final qrImageUrl = '${BaseUrl.baseUrl}/api/auth/me/qr/';

                return Container(
                  height: 250.h,
                  width: 250.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      image: NetworkImage(
                        qrImageUrl,
                        headers: {
                          'Authorization': 'Bearer $token',
                          'accept': 'application/json',
                        },
                      ),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.qr_code_2, size: 100, color: Colors.grey),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20.h),
            CustomText(
              text: "Scan my QR code to message me",
              color: AppColors.readColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 72.h),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Column(
                children: [
                  CustomQRCodeButtonWidget(
                    title: "Become a Brand Ambassador",
                    onTap: () {
                      Get.toNamed(
                        AppRoute.ambassadorScreen,
                        arguments: {'title': 'brand'},
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  CustomQRCodeButtonWidget(
                    title: "Start a Fundraiser",
                    onTap: () {
                      Get.toNamed(
                        AppRoute.ambassadorScreen,
                        arguments: {'title': 'fundraiser'},
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}