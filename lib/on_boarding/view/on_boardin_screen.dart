

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:orange/core/utils/constants/image_path.dart';

import 'package:orange/core/widgets/custom_button_widget.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/on_boarding/widget/custom_logo_svg_image.dart';

import 'package:orange/routes/app_routes.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundImageScaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Column(
              children: [
                SizedBox(
                  height: 310.h,
                ),

                SvgPicture.asset(
                  ImagePath.onBoardingImage,
                  fit: BoxFit.cover,
                  height: 330.h,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Spacer(),

                const CustomAppLogoSvgImage(),

                SizedBox(
                  height: 320.h,
                ),

                CustomButtonWidget(
                  title: "Get Started",
                  onTap: () {
                    Get.offNamed(
                     AppRoute.loginScreen,
                    );
                  },
                ),

                SizedBox(
                  height: 130.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

