// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart'; 
// import 'package:orange/auth/login/controller/log_in_controller.dart';
// import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
// import 'package:orange/core/utils/constants/app_colors.dart';
// import 'package:orange/core/utils/constants/custom_text.dart';
// import 'package:orange/core/utils/constants/icon_path.dart';
// import 'package:orange/core/widgets/custom_button_widget.dart';
// import 'package:orange/core/widgets/custom_image_background.dart';
// import 'package:orange/on_boarding/widget/custom_logo_svg_image.dart';
// import 'package:orange/routes/app_routes.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => LoginScreenState();
// }

// class LoginScreenState extends State<LoginScreen> {
//   final LoginController _controller = Get.put(LoginController());
//   final _loginFormKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return BackgroundImageScaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.w),
//             child: Form(
//               key: _loginFormKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 10.h),
//                   const CustomBackButtonwidget(),
//                   SizedBox(height: 100.h),
                  
//                   const CustomAppLogoSvgImage(width: 100, height: 95),
//                   SizedBox(height: 20.h),

//                   CustomText(
//                     text: "Please enter the email address you used when\nyou purchased your ring.",
//                     textAlign: TextAlign.center,
//                     fontSize: 15.sp,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.textGrey,
//                   ),
//                   SizedBox(height: 26.h),

//                   TextFormField(
//                     controller: _controller.emailController,
//                     keyboardType: TextInputType.emailAddress,
//                     style: const TextStyle(color: Colors.black),
//                     decoration: InputDecoration(
//                       hintText: "Enter your email",
//                       hintStyle: TextStyle(color: Colors.grey.shade500),
//                       prefixIcon: Padding(
//                         padding: EdgeInsets.all(12.w),
//                         child: Image.asset(
//                           IconPath.emailIcon,
//                           height: 24.h,
//                           width: 24.w,
//                         ),
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.r),
//                         borderSide: BorderSide(color: Colors.grey.shade300),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.r),
//                         borderSide: BorderSide(color: Colors.grey.shade300),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.trim().isEmpty) {
//                         return "Email cannot be empty";
//                       }
//                       if (!GetUtils.isEmail(value.trim())) {
//                         return "Please enter a valid email address";
//                       }
//                       return null;
//                     },
//                   ),

//                   SizedBox(height: 40.h),

//                   Obx(() {
//                     return CustomButtonWidget(
//                       title: _controller.isLoading.value ? "Sending..." : "Log In",
//                       onTap: _controller.isLoading.value
//                           ? null 
//                           : () {
//                               if (_loginFormKey.currentState!.validate()) {
//                                 FocusScope.of(context).unfocus();
//                                 _controller.sendOtp();
//                               }
//                             },
//                     );
//                   }),

//                   SizedBox(height: 80.h),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/gestures.dart'; // TapGestureRecognizer ব্যবহারের জন্য
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; 
import 'package:orange/auth/login/controller/log_in_controller.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/app_colors.dart';
import 'package:orange/core/utils/constants/custom_text.dart';
import 'package:orange/core/utils/constants/icon_path.dart';
import 'package:orange/core/widgets/custom_button_widget.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/on_boarding/widget/custom_logo_svg_image.dart';
import 'package:orange/routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final LoginController _controller = Get.put(LoginController());
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BackgroundImageScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: _loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  const CustomBackButtonwidget(),
                  SizedBox(height: 100.h),
                  
                  const CustomAppLogoSvgImage(width: 100, height: 95),
                  SizedBox(height: 20.h),

                  CustomText(
                    text: "Please enter the email address you used when\nyou purchased your ring.",
                    textAlign: TextAlign.center,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textGrey,
                  ),
                  SizedBox(height: 26.h),

                  TextFormField(
                    controller: _controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Image.asset(
                          IconPath.emailIcon,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Email cannot be empty";
                      }
                      if (!GetUtils.isEmail(value.trim())) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 40.h),

                  Obx(() {
                    return CustomButtonWidget(
                      title: _controller.isLoading.value ? "Sending..." : "Log In",
                      onTap: _controller.isLoading.value
                          ? null 
                          : () {
                              if (_loginFormKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                _controller.sendOtp();
                              }
                            },
                    );
                  }),

                  SizedBox(height: 30.h), 

                  // ================= NEW ACCOUNT REQUEST CONTAINER =================
                  _buildAccountRequestContainer(),

                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountRequestContainer() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: const Color(0xFF7E6000), 
        borderRadius: BorderRadius.circular(16.r), 
      ),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 14.sp,
            color: const Color(0xFFECECEC), 
            height: 1.4,
          ),
          children: [
            const TextSpan(
              text: "Could not find your account. Bought a ring? ",
            ),
            TextSpan(
              text: "Request for an account",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.underline, 
              ),
              recognizer: TapGestureRecognizer()
                .. onTap = () {
                
                  Get.toNamed(AppRoute.getRequestAccountScreen());
                  debugPrint("Request for account clicked");
                },
            ),
          ],
        ),
      ),
    );
  }
}