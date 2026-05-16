import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/constants/image_path.dart';

class CustomAppLogoSvgImage extends StatelessWidget {
  const CustomAppLogoSvgImage({
    super.key,  this.height = 330,  this.width =  135,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(ImagePath.appLogoImage,width: height.h,height: width.w,);
  }
}