// import 'package:flutter/material.dart';
// import 'package:orange/core/utils/constants/app_colors.dart';
// import 'package:orange/core/utils/constants/app_sizer.dart';
// import 'package:google_fonts/google_fonts.dart';


// class CustomTextField extends ConsumerWidget {
//   const CustomTextField({
//     super.key,
//     this.controller,
//     required this.hintText,
//     this.obscureText = false,
//     this.validator,
//     this.keyboardType = TextInputType.text,
//     this.readOnly = false,
//     this.fillColor,
//     this.maxLine,
//     this.radius = 8,
//     this.onFieldSubmitted,
//     this.onChanged,
//     this.value,
//     this.prefixIcon,
//     this.focusNode,           // ✅ Added focusNode
//     this.visibilityProvider,
//   });

//   final TextEditingController? controller;
//   final String hintText;
//   final bool obscureText;
//   final dynamic fillColor;
//   final String? Function(String?)? validator;
//   final TextInputType keyboardType;
//   final bool readOnly;
//   final int? maxLine;
//   final double radius;
//   final String? value;
//   final void Function(String)? onFieldSubmitted;
//   final Widget? prefixIcon;
//   final Function(String)? onChanged;
//   final FocusNode? focusNode; // ✅ FocusNode added

//   /// Individual visibility provider
//   final StateProvider<bool>? visibilityProvider;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isVisible = visibilityProvider != null
//         ? ref.watch(visibilityProvider!)
//         : false;

//     return TextFormField(
//       initialValue: value,
//       onChanged: onChanged,
//       onFieldSubmitted: onFieldSubmitted,
//       focusNode: focusNode, // ✅ Use the passed focusNode
//       maxLines: maxLine ?? 1,
//       readOnly: readOnly,
//       keyboardType: keyboardType,
//       obscureText: obscureText ? !isVisible : false,
//       controller: controller,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       onTapOutside: (_) => FocusScope.of(context).unfocus(),
//       decoration: InputDecoration(
//         hintText: hintText,
//         suffixIcon: obscureText
//             ? IconButton(
//           icon: Icon(
//             isVisible ? Icons.visibility : Icons.visibility_off,
//             color: AppColors.textGrey,
//           ),
//           onPressed: () {
//             if (visibilityProvider != null) {
//               ref.read(visibilityProvider!.notifier).state = !isVisible;
//             }
//           },
//         )
//             : null,
//         prefixIcon: prefixIcon,
//         hintStyle: GoogleFonts.dmSans(
//           color: AppColors.textGrey,
//           fontWeight: FontWeight.w400,
//           fontSize: 14.sp,
//           height: 20 / 14,
//         ),
//         fillColor: fillColor ?? Colors.transparent,
//         filled: true,
//         labelStyle: TextStyle(fontSize: 14, color: Colors.black),

//         errorStyle: TextStyle(fontSize: 12, color: Colors.red),
//         floatingLabelStyle: TextStyle(color: Colors.black.withValues(alpha: 0.8)),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(14),
//           borderSide: BorderSide(color: Colors.grey),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(14),
//           borderSide: BorderSide(color: Colors.grey),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(14),
//           borderSide: BorderSide(color: Colors.black),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(14),
//           borderSide: BorderSide(color: Colors.red),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(14),
//           borderSide: BorderSide(color: Colors.orange),
//         ),
//         contentPadding: EdgeInsets.only(
//           left: 12.w,
//           right: 10.w,
//           top: 12.h,
//           bottom: 12.h,
//         ),
//       ),
//       validator: validator,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange/core/utils/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.fillColor,
    this.maxLine,
    this.radius = 8,
    this.onFieldSubmitted,
    this.onChanged,
    this.value,
    this.prefixIcon,
    this.focusNode,
  });

  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final dynamic fillColor;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool readOnly;
  final int? maxLine;
  final double radius;
  final String? value;
  final void Function(String)? onFieldSubmitted;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final FocusNode? focusNode;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.value,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      focusNode: widget.focusNode,
      maxLines: widget.maxLine ?? 1,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText ? !isVisible : false,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        hintText: widget.hintText,

        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  isVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColors.textGrey,
                ),
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
              )
            : null,

        prefixIcon: widget.prefixIcon,

        hintStyle: GoogleFonts.dmSans(
          color: AppColors.textGrey,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          height: 20 / 14,
        ),

        fillColor: widget.fillColor ?? Colors.transparent,
        filled: true,

        labelStyle: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),

        errorStyle: const TextStyle(
          fontSize: 12,
          color: Colors.red,
        ),

        floatingLabelStyle: TextStyle(
          color: Colors.black.withOpacity(0.8),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.grey),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.grey),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.black),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.orange),
        ),

        contentPadding: EdgeInsets.only(
          left: 12.w,
          right: 10.w,
          top: 12.h,
          bottom: 12.h,
        ),
      ),
      validator: widget.validator,
    );
  }
}