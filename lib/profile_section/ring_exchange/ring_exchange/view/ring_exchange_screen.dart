import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/app_colors.dart';
import 'package:orange/core/widgets/custom_button_widget.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/profile_section/ring_exchange/ring_exchange/controller/ring_exchange_controller.dart';
import 'package:orange/routes/app_routes.dart';


class RingExchangeScreen extends StatelessWidget {
  const RingExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller injection
    final controller = Get.put(RingExchangeController());

    return BackgroundImageScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h),
          child: Column(
            children: [
              Row(
                children: [
                  CustomBackButtonwidget(
                  onTap: () => Get.offAllNamed(AppRoute.profileScreen),
                   ),
                  SizedBox(width: 75.w),
                  Text(
                    "Ring Exchange",
                    style: TextStyle(
                      fontSize: 19.sp,
                      color: AppColors.readColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Container(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 30.h, top: 30.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xffEF2D35).withOpacity(0.8),
                      const Color(0xffEF2D35).withOpacity(1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Exchange your broken or damaged Amore Ring for a new ring of the same color/same size, or same color/different size. indicate the ring you wish to exchange for. Pay the \$5.95 shipping/handling fee and send your ring exchange to:",
                      maxLines: 7,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textWhite,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: Text(
                        "AmoreRings.com\n18300 South Halsted Street\nSuite B271\nGlenwood, Illinois  60425",
                        maxLines: 4,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textWhite,
                          overflow: TextOverflow.ellipsis,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Exchanges are not issued until we receive your original ring, so be sure to get a tracking number for the package you send to us. ",
                      maxLines: 5,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textWhite,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 26.h),
                    // TextFormField(
                    //   onChanged: controller.setRingExchangeSize,
                    //   style: const TextStyle(color: AppColors.textWhite),
                    //   keyboardType: TextInputType.number,
                    //   decoration: InputDecoration(
                    //     hintText: "Your new ring size:",
                    //     hintStyle: TextStyle(color: AppColors.textWhite, fontSize: 16.sp),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(14),
                    //       borderSide: const BorderSide(color: AppColors.textWhite),
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(14),
                    //       borderSide: const BorderSide(color: AppColors.textWhite),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(14),
                    //       borderSide: const BorderSide(color: AppColors.textWhite),
                    //     ),
                    //     contentPadding: EdgeInsets.only(
                    //       left: 12.w,
                    //       right: 10.w,
                    //       top: 12.h,
                    //       bottom: 12.h,
                    //     ),
                    //   ),
                    // ),
                    Obx(
  () => DropdownButtonFormField<String>(
    value: controller.ringSize.value.isEmpty
        ? null
        : controller.ringSize.value,

    dropdownColor: const Color(0xffEF2D35),

    icon: const Icon(
      Icons.keyboard_arrow_down_rounded,
      color: AppColors.textWhite,
    ),

    style: TextStyle(
      color: AppColors.textWhite,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    ),

    decoration: InputDecoration(
      hintText: "Your new ring size:",
      hintStyle: TextStyle(
        color: AppColors.textWhite,
        fontSize: 16.sp,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: AppColors.textWhite,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: AppColors.textWhite,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: AppColors.textWhite,
        ),
      ),

      contentPadding: EdgeInsets.only(
        left: 12.w,
        right: 10.w,
        top: 12.h,
        bottom: 12.h,
      ),
    ),

    items: List.generate(
      10,
      (index) {
        final size = (index + 4).toString();

        return DropdownMenuItem<String>(
          value: size,
          child: Text(
            size,
            style: TextStyle(
              color: AppColors.textWhite,
              fontSize: 16.sp,
            ),
          ),
        );
      },
    ),

    onChanged: (value) {
      if (value != null) {
        controller.setRingExchangeSize(value);
      }
    },
  ),
),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              CustomButtonWidget(
                title: "Exchange Now",
                onTap: () {
                  Get.toNamed(AppRoute.ringExchangePurchaseSuccessScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}