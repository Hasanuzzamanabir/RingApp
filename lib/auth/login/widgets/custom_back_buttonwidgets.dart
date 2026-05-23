import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:orange/core/utils/constants/icon_path.dart';

class CustomBackButtonwidget extends StatelessWidget {
  const CustomBackButtonwidget({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
            onTap:onTap?? (){
            Get.back();
            },
            child: Image.asset(IconPath.backArrowIcon,height: 38.h,width: 38.w,)));
  }
}