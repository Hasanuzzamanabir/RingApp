
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:orange/core/utils/constants/image_path.dart'; // Import GetX

// class LogoutSuccessDialog extends StatelessWidget {
//   const LogoutSuccessDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
//       child: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             GestureDetector(
//               onTap: () => Get.back(), // Replaces Navigator.pop
//               child: const Align(
//                 alignment: Alignment.topRight,
//                 child: Icon(Icons.close, color: Colors.black),
//               ),
//             ),
//             SizedBox(height: 10.h),
//             Image.asset(ImagePath.successImage, height: 100.h, width: 100.w),
//             SizedBox(height: 20.h),
//             Text(
//               "You’ve successfully\nLogged out.",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(height: 24.h),
//             SizedBox(
//               width: double.infinity,
//               height: 55.h,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Get.offAllNamed removes all previous routes and goes to login
//                   Get.offAllNamed('/loginScreen'); 
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF009952),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: Text(
//                   "Back to Login",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orange/routes/app_routes.dart';

class LogoutSuccessDialog extends StatelessWidget {
  const LogoutSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      contentPadding: EdgeInsets.all(20.w),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 60.sp,
          ),
          SizedBox(height: 16.h),
          Text(
            "Logged Out Successfully",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed(AppRoute.onBoardingScreen); 
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffEC2028),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
          )
        ],
      ),
    );
  }
}