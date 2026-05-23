// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:get/get.dart';
// // import 'package:image_picker/image_picker.dart';

// // import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
// // import 'package:orange/core/utils/constants/app_colors.dart';
// // import 'package:orange/core/utils/constants/custom_text.dart';
// // import 'package:orange/core/widgets/custom_button_widget.dart';
// // import 'package:orange/core/widgets/custom_text_form_field.dart';
// // import 'package:orange/profile_section/profile/controller/profile_screen_controller.dart';

// // class UpdateProfileScreen extends StatelessWidget {
// //   UpdateProfileScreen({super.key});

// //   final _nameTEController = TextEditingController();
// //   final controller = Get.put(ProfileController());

// //   @override
// //   Widget build(BuildContext context) {
// //     _nameTEController.text = controller.username.value;

// //     return Scaffold(
// //       body: SafeArea(
// //         child: Column(
// //           children: [
// //             Padding(
// //               padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
// //               child: Row(
// //                 children: [
// //                   CustomBackButtonwidget(),
// //                   SizedBox(width: 85.w),
// //                   Text(
// //                     "Update Profile",
// //                     style: TextStyle(
// //                       fontSize: 18.sp,
// //                       color: AppColors.readColor,
// //                       fontWeight: FontWeight.w700,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             SizedBox(height: 15.h),
            
// //             _header(controller),
            
// //             SizedBox(height: 30.h),
            
// //             Padding(
// //               padding: EdgeInsets.only(left: 15.w, right: 15.w),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   CustomText(
// //                     text: "User Name",
// //                     fontSize: 14.sp,
// //                     fontWeight: FontWeight.w400,
// //                   ),
// //                   SizedBox(height: 10.h),
// //                   CustomTextField(
// //                     hintText: "Enter user name",
// //                     controller: _nameTEController,
// //                     onChanged: controller.updateUsername,
// //                   ),
// //                   SizedBox(height: 60.h),
// //                   CustomButtonWidget(
// //                     title: "Update",
// //                     onTap: () {
// //                     },
// //                   )
// //                 ],
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _header(UpdateProfileController controller) {
// //     return Container(
// //       height: 200.h,
// //       margin: EdgeInsets.symmetric(horizontal: 15.w),
// //       padding: const EdgeInsets.all(35),
// //       decoration: BoxDecoration(
// //         color: const Color(0xffF2F2F2),
// //         borderRadius: BorderRadius.circular(16),
// //         border: Border.all(
// //           color: const Color(0xffF2F2F2),
// //           width: 1.2.w,
// //         ),
// //       ),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Stack(
// //             children: [
// //               Obx(() => CircleAvatar(
// //                     radius: 70,
// //                     backgroundImage: controller.image.value != null
// //                         ? FileImage(controller.image.value!)
// //                         : const NetworkImage("https://picsum.photos/200")
// //                             as ImageProvider,
// //                   )),
// //               Positioned(
// //                 bottom: 0,
// //                 right: 0,
// //                 child: GestureDetector(
// //                   onTap: () async {
// //                     final picker = ImagePicker();
// //                     final picked = await picker.pickImage(source: ImageSource.gallery);
// //                     if (picked != null) {
// //                       controller.updateImage(File(picked.path));
// //                     }
// //                   },
// //                   child: Container(
// //                     padding: const EdgeInsets.all(6),
// //                     decoration: const BoxDecoration(
// //                       color: Colors.redAccent,
// //                       shape: BoxShape.circle,
// //                     ),
// //                     child: const Icon(
// //                       Icons.camera_alt,
// //                       color: Colors.white,
// //                       size: 30,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:get/get.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
// // import 'package:orange/core/utils/constants/app_colors.dart';
// // import 'package:orange/core/utils/constants/custom_text.dart';
// // import 'package:orange/core/widgets/custom_button_widget.dart';
// // import 'package:orange/core/widgets/custom_text_form_field.dart';
// // import 'package:orange/profile_section/profile/controller/profile_screen_controller.dart';

// // class UpdateProfileScreen extends StatelessWidget {
// //   UpdateProfileScreen({super.key});

// //   final _nameTEController = TextEditingController();
// //   final controller = Get.find<ProfileController>();

// //   @override
// //   Widget build(BuildContext context) {
// //     _nameTEController.text = controller.username.value;

// //     return Scaffold(
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           child: Column(
// //             children: [
// //               Padding(
// //                 padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
// //                 child: Row(
// //                   children: [
// //                     CustomBackButtonwidget(),
// //                     SizedBox(width: 85.w),
// //                     Text(
// //                       "Update Profile",
// //                       style: TextStyle(
// //                         fontSize: 18.sp,
// //                         color: AppColors.readColor,
// //                         fontWeight: FontWeight.w700,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(height: 15.h),
              
// //               _header(controller),
              
// //               SizedBox(height: 30.h),
              
// //               Padding(
// //                 padding: EdgeInsets.only(left: 15.w, right: 15.w),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     CustomText(
// //                       text: "User Name",
// //                       fontSize: 14.sp,
// //                       fontWeight: FontWeight.w400,
// //                     ),
// //                     SizedBox(height: 10.h),
// //                   CustomTextField(
// //   hintText: "Enter user name",
// //   controller: _nameTEController,
// // ),
// //                     SizedBox(height: 60.h),
// //                     Obx(() {
// //                       return CustomButtonWidget(
// //   title: controller.isProfileLoading.value ? "Updating..." : "Update",
// //   onTap: controller.isProfileLoading.value
// //       ? null
// //       : () async {
// //           FocusScope.of(context).unfocus();
// //           // 🚀 কন্ট্রোলারের মেথডে সরাসরি টেক্সট কন্ট্রোলারের কারেন্ট টেক্সট পাস করে দিন
// //           await controller.updateProfile(_nameTEController.text);
// //         },
// // );
// //                     }),
// //                   ],
// //                 ),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _header(ProfileController controller) {
// //     return Container(
// //       height: 200.h,
// //       margin: EdgeInsets.symmetric(horizontal: 15.w),
// //       padding: const EdgeInsets.all(35),
// //       decoration: BoxDecoration(
// //         color: const Color(0xffF2F2F2),
// //         borderRadius: BorderRadius.circular(16),
// //         border: Border.all(
// //           color: const Color(0xffF2F2F2),
// //           width: 1.2.w,
// //         ),
// //       ),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Stack(
// //             children: [
// //               Obx(() => CircleAvatar(
// //                     radius: 70,
// //                     backgroundColor: Colors.grey.shade300,
// //                     backgroundImage: controller.profileImage.value != null
// //                         ? FileImage(controller.profileImage.value!) as ImageProvider
// //                         : NetworkImage(controller.profilePictureUrl.value),
// //                   )),
// //               Positioned(
// //                 bottom: 0,
// //                 right: 0,
// //                 child: GestureDetector(
// //                   onTap: () async {
// //                     await controller.pickProfileImage();
// //                   },
// //                   child: Container(
// //                     padding: const EdgeInsets.all(6),
// //                     decoration: const BoxDecoration(
// //                       color: Colors.redAccent,
// //                       shape: BoxShape.circle,
// //                     ),
// //                     child: const Icon(
// //                       Icons.camera_alt,
// //                       color: Colors.white,
// //                       size: 30,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
// import 'package:orange/core/utils/constants/app_colors.dart';
// import 'package:orange/core/utils/constants/custom_text.dart';
// import 'package:orange/core/utils/constants/image_path.dart';
// import 'package:orange/core/widgets/custom_button_widget.dart';
// import 'package:orange/core/widgets/custom_text_form_field.dart';
// import 'package:orange/profile_section/profile/controller/profile_screen_controller.dart';

// class UpdateProfileScreen extends StatelessWidget {
//   UpdateProfileScreen({super.key});

//   final _nameTEController = TextEditingController();
//   final controller = Get.find<ProfileController>();

//   @override
//   Widget build(BuildContext context) {
//     _nameTEController.text = controller.username.value;

//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
//                 child: Row(
//                   children: [
//                     CustomBackButtonwidget(),
//                     SizedBox(width: 85.w),
//                     Text(
//                       "Update Profile",
//                       style: TextStyle(
//                         fontSize: 18.sp,
//                         color: AppColors.readColor,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 15.h),
              
//               _header(controller),
              
//               SizedBox(height: 30.h),
              
//               Padding(
//                 padding: EdgeInsets.only(left: 15.w, right: 15.w),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomText(
//                       text: "User Name",
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     SizedBox(height: 10.h),
//                     CustomTextField(
//                       hintText: "Enter user name",
//                       controller: _nameTEController,
//                     ),
//                     SizedBox(height: 60.h),
//                     Obx(() {
//                       return CustomButtonWidget(
//                         title: controller.isProfileLoading.value ? "Updating..." : "Update",
//                         onTap: controller.isProfileLoading.value
//                             ? null
//                             : () async {
//                                 FocusScope.of(context).unfocus();
//                                 await controller.updateProfile(_nameTEController.text);
//                               },
//                       );
//                     }),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _header(ProfileController controller) {
//     return Container(
//       height: 200.h,
//       margin: EdgeInsets.symmetric(horizontal: 15.w),
//       padding: const EdgeInsets.all(35),
//       decoration: BoxDecoration(
//         color: const Color(0xffF2F2F2),
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(
//           color: const Color(0xffF2F2F2),
//           width: 1.2.w,
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Stack(
//             children: [
//               Obx(() => CircleAvatar(
//                     radius: 70,
//                     backgroundColor: Colors.grey.shade300,
//                    // 🚀 ৩টি পেজের CircleAvatar এর backgroundImage-এ জাস্ট এই রিড লজিকটি রাখুন:
// backgroundImage: controller.profileImage.value != null
//     ? FileImage(controller.profileImage.value!) as ImageProvider
//     : (controller.profilePictureUrl.value.isNotEmpty
//         ? NetworkImage(controller.profilePictureUrl.value)
//         : const AssetImage(ImagePath.profileImage) as ImageProvider),// আপনার প্রজেক্টের ডিফল্ট অ্যাসেট পথ
//                   )),
//               Positioned(
//                 bottom: 0,
//                 right: 0,
//                 child: GestureDetector(
//                   onTap: () async {
//                     await controller.pickProfileImage();
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(6),
//                     decoration: const BoxDecoration(
//                       color: Colors.redAccent,
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(
//                       Icons.camera_alt,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// ================= UPDATE PROFILE SCREEN =================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/app_colors.dart';
import 'package:orange/core/utils/constants/custom_text.dart';
import 'package:orange/core/widgets/custom_button_widget.dart';
import 'package:orange/core/widgets/custom_text_form_field.dart';
import 'package:orange/profile_section/profile/controller/profile_screen_controller.dart';
import 'package:orange/profile_section/profile_avatar_widget.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() =>
      _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _nameTEController = TextEditingController();

  final controller = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();

    _nameTEController.text = controller.username.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
                child: Row(
                  children: [
                    CustomBackButtonwidget(),
                    SizedBox(width: 85.w),
                    Text(
                      "Update Profile",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.readColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15.h),

              _header(controller),

              SizedBox(height: 30.h),

              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "User Name",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),

                    SizedBox(height: 10.h),

                    CustomTextField(
                      hintText: "Enter user name",
                      controller: _nameTEController,
                    ),

                    SizedBox(height: 60.h),

                    Obx(() {
                      return CustomButtonWidget(
                        title: controller.isProfileLoading.value
                            ? "Updating..."
                            : "Update",
                        onTap: controller.isProfileLoading.value
                            ? null
                            : () async {
                                FocusScope.of(context).unfocus();

                                await controller.updateProfile(
                                  _nameTEController.text,
                                );
                              },
                      );
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(ProfileController controller) {
    return Container(
      height: 200.h,
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      padding: const EdgeInsets.all(35),
      decoration: BoxDecoration(
        color: const Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              // NEW IMAGE WIDGET
              profileAvatar(controller, 70),

              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () async {
                    await controller.pickProfileImage();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}