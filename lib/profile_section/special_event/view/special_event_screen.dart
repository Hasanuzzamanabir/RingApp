import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/image_path.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import '../../../../core/utils/constants/app_colors.dart';

class SpecialEventScreen extends StatelessWidget {
  const SpecialEventScreen({super.key});

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

                  Expanded(child: Center(child: Text("Special Event",style: TextStyle(fontSize: 18.sp,color: AppColors.readColor,fontWeight: FontWeight.w700),))),
        
                ],
              ),
              SizedBox(height: 40.h,),
              Container(
                height: 300.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white, // important for shadow visibility
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 1, color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.8), // soft white shadow
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 4), // subtle downward shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    ImagePath.youtubeImage,
                    height: 170.h,
                    width: 270.w,
                  ),
                ),
              ),
              SizedBox(height: 15.h,),
              Align(alignment: Alignment.topRight,
                  child: TextButton(onPressed: (){}, child: Text("Click here",style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline,fontSize: 15.sp,decorationColor: Colors.blue),)))


            ],
          ),
        ),
      ),
    );
  }
}
