
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/icon_path.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/routes/app_routes.dart';

import '../../../../core/utils/constants/app_colors.dart';

class AmbassadorScreen extends StatelessWidget {
  const AmbassadorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final title = Get.arguments?['title'] ?? '';
    final bool isFundraiser = title == "fundraiser";

    return BackgroundImageScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
          child: Column(
            children: [
              Row(
                children: [
                 CustomBackButtonwidget(),
                  Expanded(
                    child: Center(
                      child: Text(
                        isFundraiser
                            ? "Start a Fundraiser"
                            : "Become a Brand Ambassador",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: AppColors.readColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: const Color(0xffF5F4F4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: isFundraiser
                    ? Text(
                        "Amore Rings are hypoallergenic and make for great fundraising events. To help your event or organization, Amore Rings are sold at a discounted rate. Your organization earns a 20% commission on every ring sold through your fundraiser, while earning bonus money for reaching preset goals. To get started, select a time to watch our orientation video and then signup your organization. Once you complete the video and we approve your account, you will receive your QR code and fundraiser link. Use your fundraiser QR code in person and fundraiser link online and via text messaging. Don't worry about inventory. We process orders and handle all shipping. To account for all sales and any refunds, commissions from fundraisers are paid on the third Thursday of every month after the end of the signup month. For example, an organization signs up on any day in April and has sales. Commissions for April sales will be paid on the third Thursday of May. Commissions for May will be paid on the third Thursday of June, and so on. Select an Orientation Time",
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                      )
                    
                     : Text(
                        "Thank you for your interest in becoming an Amore Rings Brand Ambassador. Now that you've purchased your ring and downloaded our app, select a time to watch our Brand Ambassador orientation video. Once you complete the video and we approve your account, you will receive your QR code and brand ambassador link. Use your brand ambassador QR code in person and brand ambassador links online to earn a 20% commission on every ring you sell. Sell 25 rings and we will refund the purchase price of your ring. Never touch inventory. We process orders and handle all shipping. To account for all sales and any refunds, brand ambassador commissions are paid on the third Thursday of every month after the end of the month they signup. For example, a brand ambassador signs up on any day in April and has sales. Commissions for April sales will be paid on the third Thursday of May. Commissions for May will be paid on the third Thursday of June, and so on.",
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                      )
              ),
              SizedBox(height: 77.h),
              CustomAmbassadorButton(
                onTap: () {
                  Get.toNamed(
                    AppRoute.schedulerScreen,
                    arguments: {
                      "title": isFundraiser ? "fundraiser" : "brand",
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Button stays the same (StatelessWidget)
class CustomAmbassadorButton extends StatelessWidget {
  const CustomAmbassadorButton({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [Color(0xffFF868A), Color(0xffEC2028)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select Orientation Time",
                style: TextStyle(color: const Color(0xffFFFFFF), fontSize: 16.sp),
              ),
              SizedBox(width: 10.w),
              Image.asset(IconPath.calenderIcon, height: 24.h, width: 24.w)
            ],
          ),
        ),
      ),
    );
  }
}