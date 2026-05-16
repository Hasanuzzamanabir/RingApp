

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key, required this.title, this.onTap,
  });
  final String title;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color(0xffFF868A),
              Color(0xffEC2028),
            ],  // Gradient colors
            begin: Alignment.topCenter,              // Start point of the gradient
            end: Alignment.bottomCenter,            // End point of the gradient
          ),
        ),
        child: // Your child widgets here, e.g. a Text widget or image
        Center(
          child: Text(
            title,
            style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16.sp,fontWeight: FontWeight.
            w600),
          ),
        ),
      ),
    );
  }
}