import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/app_colors.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:url_launcher/url_launcher.dart';
class RefundScreen extends StatelessWidget {
  const RefundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundImageScaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(left: 16.w,right: 16.w,top: 10.h),
          child: Column(
            children: [
              Row(
                children: [
     CustomBackButtonwidget(),
                  SizedBox(width: 100.w,),
                  Text("Refund",style: TextStyle(fontSize: 19.sp,color: AppColors.readColor,fontWeight: FontWeight.w700),),

                ],
              ),
              SizedBox(height: 40.h,),
              Container(
                padding: EdgeInsets.only(left: 15.w,right: 15.w,bottom: 60.h,top: 30.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffEF2D35).withValues(alpha: 0.7),
                      Color(0xffEF2D35).withValues(alpha: 1),
                    ], // Gradient colors
                    begin: Alignment.topLeft, // Start point of the gradient
                    end: Alignment.bottomRight, // End point of the gradient
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You have until 10-31-2025 to return your Amore Ring for a complete refund.",
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textWhite,
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Send the ring along with your registered email address to:",
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textWhite,
                          overflow: TextOverflow.ellipsis
                      ),

                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: Text(
                        "AmoreRings.com \n18300 South Halsted Street\nSuite B271\nGlenwood, Illinois  60425 ",
                        maxLines: 4,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textWhite,
                            overflow: TextOverflow.ellipsis
                        ),textAlign: TextAlign.center,

                      ),
                    ),
                    SizedBox(height: 10.h),

                    Text(
                      "Refunds are not issued until we receive your original ring, so be sure to get a tracking number for the package you send to us.",
                      maxLines: 3,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textWhite,
                          overflow: TextOverflow.ellipsis
                      ),

                    ),
                    SizedBox(height: 10.h),
                    RichText(text: TextSpan(children: [
                      TextSpan(text: "Feel free to email any refund questions to:   ",style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textWhite,
                          overflow: TextOverflow.ellipsis
                      )),
                      TextSpan(
                        text: "exchanges@amorerings.com",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff3B82F6),
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xff3B82F6),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            final Uri emailUri = Uri(
                              scheme: 'mailto',
                              path: 'exchanges@amorerings.com',
                              query: 'subject=Ring Exchange Request',
                            );
                            if (await canLaunchUrl(emailUri)) {
                              await launchUrl(emailUri);
                            } else {
                              debugPrint("Could not launch email client.");
                            }},
                      ),

                    ])),


                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
