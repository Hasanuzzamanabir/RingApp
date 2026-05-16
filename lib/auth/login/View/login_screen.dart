import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/app_colors.dart';
import 'package:orange/core/utils/constants/custom_text.dart';
import 'package:orange/core/utils/constants/icon_path.dart';
import 'package:orange/core/widgets/custom_button_widget.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/core/widgets/custom_text_form_field.dart';
import 'package:orange/on_boarding/widget/custom_logo_svg_image.dart';
import 'package:orange/routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImageScaffold(body: SafeArea(child: 
    
   SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
               // key: _loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.h,),
                   // if(!isLogOut)
                    //const CustomBackButtonWidget(),
                   const CustomBackButtonwidget(),

                    SizedBox(height: 100.h),

                    const CustomAppLogoSvgImage(width: 100, height: 95),
                    SizedBox(height: 20.h),

                    CustomText(
                      text:
                      "Please enter the email address you used when\nyou purchased your ring.",
                      textAlign: TextAlign.center,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGrey,
                    ),
                    SizedBox(height: 26.h),
                    CustomTextField(
                    //  value: state.email,
                       // focusNode: _emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                       // validator: AppValidator.validateEmail,
                        onChanged: (value) {
                          // Update the state whenever the user types
                          // notifier.setEmail(value.trim());
                        },
                      prefixIcon: Image.asset(
                              IconPath.emailIcon,
                              height: 24.h,
                              width: 24.w,
                            ),
                        hintText: "Enter your email"),



                    SizedBox(height: 40.h),

                    CustomButtonWidget(
                      title: "Log In",
                      onTap: () {
                        // if (_loginFormKey.currentState!.validate()) {
                        //   FocusScope.of(context).unfocus();
                        //  // notifier.setEmail(emailController.text.trim());
                        //   Navigator.pushNamed(
                        //     context,
                        //     RouteNames.otpVerifyScreen,
                        //     //arguments: {'email': state.email},
                        //   );
                        // }
                          Get.toNamed(
                     AppRoute.otpverifyScreen,
                    );
                        
                      },
                    ),

                    SizedBox(height: 80.h),
                  ],
                ),
              ),
            ),
          ),));
  }
}