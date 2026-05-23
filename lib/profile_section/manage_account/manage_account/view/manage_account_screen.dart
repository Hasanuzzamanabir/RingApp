// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
// import 'package:orange/core/utils/constants/icon_path.dart';
// import 'package:orange/profile_section/manage_account/manage_account/widget/update_password_dialouge.dart';
// import 'package:orange/profile_section/manage_account/update_profile/view/update_profile_screen.dart';
// import 'package:orange/profile_section/profile/controller/profile_screen_controller.dart';
// import 'package:orange/routes/app_routes.dart';
// import '../../../../../core/utils/constants/app_colors.dart';
// import '../controller/manage_account_controller.dart';

// class ManageAccountScreen extends StatelessWidget {
//   ManageAccountScreen({super.key});
// final ProfileController profileController = Get.find<ProfileController>();
//   final ManageAccountController controller =
//       Get.put(ManageAccountController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Obx(
//             () => Column(
//               children: [
//                 Padding(
//                   padding:
//                       EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
//                   child: Row(
//                     children: [
//                       CustomBackButtonwidget(),
//                       SizedBox(
//                         width: 105.w,
//                       ),
//                       Text(
//                         "Settings",
//                         style: TextStyle(
//                           fontSize: 19.sp,
//                           color: AppColors.readColor,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),

//                 _header(profileController),
//                 SizedBox(height: 20.h),

//                 _accountInformation(context),

//                 SizedBox(height: 10.h),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // /// ✅ Header
// // Widget _header(ManageAccountController controller) {
// //   return Container(
// //     height: 150.h,
// //     margin: EdgeInsets.symmetric(horizontal: 15.w),
// //     padding: const EdgeInsets.all(35),
// //     decoration: BoxDecoration(
// //       color: const Color(0xffF2F2F2),
// //       borderRadius: BorderRadius.circular(11),
// //       border: Border.all(
// //         color: const Color(0xffF2F2F2),
// //         width: 1.2.w,
// //       ),
// //     ),
// //     child: Row(
// //       children: [
// //         Stack(
// //           children: [
// //             CircleAvatar(
// //               radius: 35,
// //               backgroundImage: controller.image.value != null
// //                   ? FileImage(controller.image.value!)
// //                   : const NetworkImage(
// //                           "https://picsum.photos/200")
// //                       as ImageProvider,
// //             ),
// //             Positioned(
// //               bottom: 0,
// //               right: 0,
// //               child: GestureDetector(
// //                 onTap: () async {
// //                   final picker = ImagePicker();

// //                   final picked = await picker.pickImage(
// //                     source: ImageSource.gallery,
// //                   );

// //                   if (picked != null) {
// //                     controller.updateImage(
// //                       File(picked.path),
// //                     );
// //                   }
// //                 },
// //                 child: Container(
// //                   padding: const EdgeInsets.all(6),
// //                   decoration: const BoxDecoration(
// //                     color: Colors.redAccent,
// //                     shape: BoxShape.circle,
// //                   ),
// //                   child: const Icon(
// //                     Icons.camera_alt,
// //                     color: Colors.white,
// //                     size: 15,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),

// //         SizedBox(width: 25.w),

// //         Text(
// //           controller.username.value,
// //           style: TextStyle(
// //             fontSize: 18.sp,
// //             fontWeight: FontWeight.bold,
// //             color: Colors.black87,
// //           ),
// //         ),
// //       ],
// //     ),
// //   );
// // }
// // Widget _header(ProfileController controller) {
// //   return Container(
// //     height: 150.h,
// //     margin: EdgeInsets.symmetric(horizontal: 15.w),
// //     padding: const EdgeInsets.all(35),
// //     decoration: BoxDecoration(
// //       color: const Color(0xffF2F2F2),
// //       borderRadius: BorderRadius.circular(11),
// //       border: Border.all(
// //         color: const Color(0xffF2F2F2),
// //         width: 1.2.w,
// //       ),
// //     ),
// //     child: Row(
// //       children: [
// //         Stack(
// //           children: [
// //             CircleAvatar(
// //               radius: 35,
// //               backgroundColor: Colors.grey.shade300,
// //               backgroundImage: controller.profileImage.value != null
// //                   ? FileImage(controller.profileImage.value!) as ImageProvider
// //                   : NetworkImage(controller.profilePictureUrl.value),
// //             ),
// //             Positioned(
// //               bottom: 0,
// //               right: 0,
// //               child: GestureDetector(
// //                 onTap: () async {
// //                   await controller.pickProfileImage();
// //                 },
// //                 child: Container(
// //                   padding: const EdgeInsets.all(6),
// //                   decoration: const BoxDecoration(
// //                     color: Colors.redAccent,
// //                     shape: BoxShape.circle,
// //                   ),
// //                   // child: const Icon(
// //                   //   Icons.camera_alt,
// //                   //   color: Colors.white,
// //                   //   size: 15,
// //                   // ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //         SizedBox(width: 25.w),
// //         Text(
// //           controller.username.value,
// //           style: TextStyle(
// //             fontSize: 18.sp,
// //             fontWeight: FontWeight.bold,
// //             color: Colors.black87,
// //           ),
// //         ),
// //       ],
// //     ),
// //   );
// // }
// Widget _header(ProfileController controller) {
//     return Obx(() => Container(
//           height: 150.h,
//           margin: EdgeInsets.symmetric(horizontal: 15.w),
//           padding: const EdgeInsets.all(35),
//           decoration: BoxDecoration(
//             color: const Color(0xffF2F2F2),
//             borderRadius: BorderRadius.circular(11),
//             border: Border.all(
//               color: const Color(0xffF2F2F2),
//               width: 1.2.w,
//             ),
//           ),
//           child: Row(
//             children: [
//               Stack(
//                 children: [
//                   CircleAvatar(
//                     radius: 35,
//                     backgroundColor: Colors.grey.shade300,
//                     backgroundImage: controller.profileImage.value != null
//                         ? FileImage(controller.profileImage.value!) as ImageProvider
//                         : NetworkImage(controller.profilePictureUrl.value),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: GestureDetector(
//                       onTap: () async {
//                         await controller.pickProfileImage();
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.all(6),
//                         decoration: const BoxDecoration(
//                           color: Colors.redAccent,
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(width: 25.w),
//               Text(
//                 controller.username.value,
//                 style: TextStyle(
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }


// /// ✅ Account Information Section
// Widget _accountInformation(BuildContext context) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
//         child: Text(
//           "Account Information",
//           style: TextStyle(
//             fontSize: 18.sp,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),

//       SizedBox(height: 4.h),

//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.w),
//         child: Column(
//           children: [
//             Container(
//               height: 4.h,
//               color: const Color(0xffE3E0E0),
//             ),

//             SizedBox(height: 4.h),
//           ],
//         ),
//       ),

//       _itemTile(
//         label: "Update Profile",
//         iconPath: IconPath.updateProfileIcon,
//         trailing: Image.asset(
//           IconPath.editIcon,
//           height: 20.h,
//           width: 20.w,
//         ),
//         onTap: () {
//           Get.toNamed(AppRoute.getUpdateProfileScreen());
//         },
//       ),

//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.w),
//         child: Column(
//           children: [
//             SizedBox(height: 2.h),

//             Container(
//               height: 2.h,
//               color: const Color(0xffE3E0E0),
//             ),

//             SizedBox(height: 2.h),
//           ],
//         ),
//       ),

//       _itemTile(
//         label: "Password",
//         iconPath: IconPath.passwordIcon,
//         subtitle: "****************",
//         trailing: Image.asset(
//           IconPath.editIcon,
//           height: 20.h,
//           width: 20.w,
//         ),
//         onTap: () {
//           Get.dialog(
//              UpdatePasswordDialog(),
//             barrierDismissible: false,
//           );
//         },
//       ),

//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.w),
//         child: Column(
//           children: [
//             Container(
//               height: 2.h,
//               color: const Color(0xffE3E0E0),
//             ),

//             SizedBox(height: 2.h),
//           ],
//         ),
//       ),

//       _itemTile(
//         label: "Terms & Conditions",
//         iconPath: IconPath.privacyPolicyIcon,
//         trailing: const Icon(
//           Icons.arrow_forward_ios,
//           size: 18,
//         ),
//         onTap: () {
//          Get.toNamed(AppRoute.getTermsAndConditionScreen());
//         },
//       ),

//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.w),
//         child: Column(
//           children: [
//             SizedBox(height: 2.h),

//             Container(
//               height: 2.h,
//               color: const Color(0xffE3E0E0),
//             ),

//             SizedBox(height: 2.h),
//           ],
//         ),
//       ),

//       _itemTile(
//         label: "Privacy Policy",
//         iconPath: IconPath.privacyPolicyIcon,
//         trailing: const Icon(
//           Icons.arrow_forward_ios,
//           size: 18,
//         ),
//         onTap: () {
//           Get.toNamed(AppRoute.getPrivacyPolicyScreen());
//         },
//       ),
//     ],
//   );
// }

// /// ✅ Reusable item
// Widget _itemTile({
//   required String label,
//   required String iconPath,
//   String? subtitle,
//   Widget? trailing,
//   VoidCallback? onTap,
// }) {
//   return ListTile(
//     contentPadding: const EdgeInsets.symmetric(horizontal: 18),

//     leading: Image.asset(
//       iconPath,
//       height: 28.h,
//       width: 28.w,
//     ),

//     title: Text(
//       label,
//       style: TextStyle(
//         fontSize: 16.sp,
//         fontWeight: FontWeight.w600,
//       ),
//     ),

//     subtitle: subtitle != null ? Text(subtitle) : null,

//     trailing: trailing,

//     onTap: onTap,
//   );
// }import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
// import 'package:orange/core/utils/constants/icon_path.dart';
// import 'package:orange/profile_section/manage_account/manage_account/widget/update_password_dialouge.dart';
// import 'package:orange/profile_section/manage_account/update_profile/view/update_profile_screen.dart';
// import 'package:orange/profile_section/profile/controller/profile_screen_controller.dart';
// import 'package:orange/routes/app_routes.dart';
// import '../../../../../core/utils/constants/app_colors.dart';
// import '../controller/manage_account_controller.dart';

// class ManageAccountScreen extends StatelessWidget {
//   ManageAccountScreen({super.key});

//   final ProfileController profileController = Get.find<ProfileController>();
//   final ManageAccountController controller = Get.put(ManageAccountController());

//   @override
//   Widget build(BuildContext context) {
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
//                     SizedBox(width: 105.w),
//                     Text(
//                       "Settings",
//                       style: TextStyle(
//                         fontSize: 19.sp,
//                         color: AppColors.readColor,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 15.h),

//               _header(profileController),
              
//               SizedBox(height: 20.h),

//               _accountInformation(context),

//               SizedBox(height: 10.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget _header(ProfileController controller) {
//   return Container(
//     height: 150.h,
//     margin: EdgeInsets.symmetric(horizontal: 15.w),
//     padding: const EdgeInsets.all(35),
//     decoration: BoxDecoration(
//       color: const Color(0xffF2F2F2),
//       borderRadius: BorderRadius.circular(11),
//       border: Border.all(
//         color: const Color(0xffF2F2F2),
//         width: 1.2.w,
//       ),
//     ),
//     child: Row(
//       children: [
//         Obx(() => CircleAvatar(
//               radius: 35,
//               backgroundColor: Colors.grey.shade300,
//               backgroundImage: controller.profilePictureUrl.value.isNotEmpty
//                   ? NetworkImage(controller.profilePictureUrl.value)
//                   : const NetworkImage("https://picsum.photos/200") as ImageProvider,
//             )),
//         SizedBox(width: 25.w),
//         Obx(() => Text(
//               controller.username.value,
//               style: TextStyle(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             )),
//       ],
//     ),
//   );
// }

// Widget _accountInformation(BuildContext context) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
//         child: Text(
//           "Account Information",
//           style: TextStyle(
//             fontSize: 18.sp,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       SizedBox(height: 4.h),
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.w),
//         child: Column(
//           children: [
//             Container(
//               height: 4.h,
//               color: const Color(0xffE3E0E0),
//             ),
//             SizedBox(height: 4.h),
//           ],
//         ),
//       ),
//       _itemTile(
//         label: "Update Profile",
//         iconPath: IconPath.updateProfileIcon,
//         trailing: Image.asset(
//           IconPath.editIcon,
//           height: 20.h,
//           width: 20.w,
//         ),
//         onTap: () {
//           Get.toNamed(AppRoute.getUpdateProfileScreen());
//         },
//       ),
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.w),
//         child: Column(
//           children: [
//             SizedBox(height: 2.h),
//             Container(
//               height: 2.h,
//               color: const Color(0xffE3E0E0),
//             ),
//             SizedBox(height: 2.h),
//           ],
//         ),
//       ),
//       _itemTile(
//         label: "Password",
//         iconPath: IconPath.passwordIcon,
//         subtitle: "****************",
//         trailing: Image.asset(
//           IconPath.editIcon,
//           height: 20.h,
//           width: 20.w,
//         ),
//         onTap: () {
//           Get.dialog(
//             UpdatePasswordDialog(),
//             barrierDismissible: false,
//           );
//         },
//       ),
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.w),
//         child: Column(
//           children: [
//             Container(
//               height: 2.h,
//               color: const Color(0xffE3E0E0),
//             ),
//             SizedBox(height: 2.h),
//           ],
//         ),
//       ),
//       _itemTile(
//         label: "Terms & Conditions",
//         iconPath: IconPath.privacyPolicyIcon,
//         trailing: const Icon(
//           Icons.arrow_forward_ios,
//           size: 18,
//         ),
//         onTap: () {
//           Get.toNamed(AppRoute.getTermsAndConditionScreen());
//         },
//       ),
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.w),
//         child: Column(
//           children: [
//             SizedBox(height: 2.h),
//             Container(
//               height: 2.h,
//               color: const Color(0xffE3E0E0),
//             ),
//             SizedBox(height: 2.h),
//           ],
//         ),
//       ),
//       _itemTile(
//         label: "Privacy Policy",
//         iconPath: IconPath.privacyPolicyIcon,
//         trailing: const Icon(
//           Icons.arrow_forward_ios,
//           size: 18,
//         ),
//         onTap: () {
//           Get.toNamed(AppRoute.getPrivacyPolicyScreen());
//         },
//       ),
//     ],
//   );
// }

// Widget _itemTile({
//   required String label,
//   required String iconPath,
//   String? subtitle,
//   Widget? trailing,
//   VoidCallback? onTap,
// }) {
//   return ListTile(
//     contentPadding: const EdgeInsets.symmetric(horizontal: 18),
//     leading: Image.asset(
//       iconPath,
//       height: 28.h,
//       width: 28.w,
//     ),
//     title: Text(
//       label,
//       style: TextStyle(
//         fontSize: 16.sp,
//         fontWeight: FontWeight.w600,
//       ),
//     ),
//     subtitle: subtitle != null ? Text(subtitle) : null,
//     trailing: trailing,
//     onTap: onTap,
//   );
// }
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
// import 'package:orange/core/utils/constants/icon_path.dart';
// import 'package:orange/core/utils/constants/image_path.dart';
// import 'package:orange/profile_section/manage_account/manage_account/widget/update_password_dialouge.dart';
// import 'package:orange/profile_section/manage_account/update_profile/view/update_profile_screen.dart';
// import 'package:orange/profile_section/profile/controller/profile_screen_controller.dart';
// import 'package:orange/routes/app_routes.dart';
// import '../../../../../core/utils/constants/app_colors.dart';
// import '../controller/manage_account_controller.dart';

// class ManageAccountScreen extends StatelessWidget {
//   ManageAccountScreen({super.key});

//   final ProfileController profileController = Get.find<ProfileController>();
//   final ManageAccountController controller = Get.put(ManageAccountController());

//   @override
//   Widget build(BuildContext context) {
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
//                     SizedBox(width: 105.w),
//                     Text(
//                       "Settings",
//                       style: TextStyle(
//                         fontSize: 19.sp,
//                         color: AppColors.readColor,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 15.h),

//               _header(profileController),
              
//               SizedBox(height: 20.h),

//               _accountInformation(context),

//               SizedBox(height: 10.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget _header(ProfileController controller) {
//   return Container(
//     height: 150.h,
//     margin: EdgeInsets.symmetric(horizontal: 15.w),
//     padding: const EdgeInsets.all(35),
//     decoration: BoxDecoration(
//       color: const Color(0xffF2F2F2),
//       borderRadius: BorderRadius.circular(11),
//       border: Border.all(
//         color: const Color(0xffF2F2F2),
//         width: 1.2.w,
//       ),
//     ),
//     child: Row(
//       children: [
//         Obx(() => CircleAvatar(
//               radius: 35,
//               backgroundColor: Colors.grey.shade300,
//      // 🚀 ৩টি পেজের CircleAvatar এর backgroundImage-এ জাস্ট এই রিড লজিকটি রাখুন:
// backgroundImage: controller.profileImage.value != null
//     ? FileImage(controller.profileImage.value!) as ImageProvider
//     : (controller.profilePictureUrl.value.isNotEmpty
//         ? NetworkImage(controller.profilePictureUrl.value)
//         : const AssetImage(ImagePath.profileImage) as ImageProvider),
//             )),
//         SizedBox(width: 25.w),
//         Obx(() => Text(
//               controller.username.value,
//               style: TextStyle(
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             )),
//       ],
//     ),
//   );
// }

// Widget _accountInformation(BuildContext context) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
//         child: Text(
//           "Account Information",
//           style: TextStyle(
//             fontSize: 18.sp,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       SizedBox(height: 4.h),
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.w),
//         child: Column(
//           children: [
//             Container(
//               height: 4.h,
//               color: const Color(0xffE3E0E0),
//             ),
//             SizedBox(height: 4.h),
//           ],
//         ),
//       ),
//       _itemTile(
//         label: "Update Profile",
//         iconPath: IconPath.updateProfileIcon,
//         trailing: Image.asset(
//           IconPath.editIcon,
//           height: 20.h,
//           width: 20.w,
//         ),
//         onTap: () {
//           Get.toNamed(AppRoute.getUpdateProfileScreen());
//         },
//       ),
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.w),
//         child: Column(
//           children: [
//             SizedBox(height: 2.h),
//             Container(
//               height: 2.h,
//               color: const Color(0xffE3E0E0),
//             ),
//             SizedBox(height: 2.h),
//           ],
//         ),
//       ),
//       _itemTile(
//         label: "Password",
//         iconPath: IconPath.passwordIcon,
//         subtitle: "****************",
//         trailing: Image.asset(
//           IconPath.editIcon,
//           height: 20.h,
//           width: 20.w,
//         ),
//         onTap: () {
//           Get.dialog(
//             UpdatePasswordDialog(),
//             barrierDismissible: false,
//           );
//         },
//       ),
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.w),
//         child: Column(
//           children: [
//             Container(
//               height: 2.h,
//               color: const Color(0xffE3E0E0),
//             ),
//             SizedBox(height: 2.h),
//           ],
//         ),
//       ),
//       _itemTile(
//         label: "Terms & Conditions",
//         iconPath: IconPath.privacyPolicyIcon,
//         trailing: const Icon(
//           Icons.arrow_forward_ios,
//           size: 18,
//         ),
//         onTap: () {
//           Get.toNamed(AppRoute.getTermsAndConditionScreen());
//         },
//       ),
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 18.w),
//         child: Column(
//           children: [
//             SizedBox(height: 2.h),
//             Container(
//               height: 2.h,
//               color: const Color(0xffE3E0E0),
//             ),
//             SizedBox(height: 2.h),
//           ],
//         ),
//       ),
//       _itemTile(
//         label: "Privacy Policy",
//         iconPath: IconPath.privacyPolicyIcon,
//         trailing: const Icon(
//           Icons.arrow_forward_ios,
//           size: 18,
//         ),
//         onTap: () {
//           Get.toNamed(AppRoute.getPrivacyPolicyScreen());
//         },
//       ),
//     ],
//   );
// }

// Widget _itemTile({
//   required String label,
//   required String iconPath,
//   String? subtitle,
//   Widget? trailing,
//   VoidCallback? onTap,
// }) {
//   return ListTile(
//     contentPadding: const EdgeInsets.symmetric(horizontal: 18),
//     leading: Image.asset(
//       iconPath,
//       height: 28.h,
//       width: 28.w,
//     ),
//     title: Text(
//       label,
//       style: TextStyle(
//         fontSize: 16.sp,
//         fontWeight: FontWeight.w600,
//       ),
//     ),
//     subtitle: subtitle != null ? Text(subtitle) : null,
//     trailing: trailing,
//     onTap: onTap,
//   );
// }
// ================= MANAGE ACCOUNT SCREEN =================
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/icon_path.dart';
import 'package:orange/profile_section/manage_account/manage_account/widget/update_password_dialouge.dart';
import 'package:orange/profile_section/manage_account/update_profile/view/update_profile_screen.dart';
import 'package:orange/profile_section/profile/controller/profile_screen_controller.dart';
import 'package:orange/routes/app_routes.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../controller/manage_account_controller.dart';

class ManageAccountScreen extends StatelessWidget {
  ManageAccountScreen({super.key});

  final ProfileController profileController = Get.find<ProfileController>();
  final ManageAccountController controller = Get.put(ManageAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
                child: Row(
                  children: [
                    CustomBackButtonwidget(),
                    SizedBox(width: 105.w),
                    Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 19.sp,
                        color: AppColors.readColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),

              _header(profileController),
              
              SizedBox(height: 20.h),

              _accountInformation(context),

              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _header(ProfileController controller) {
  return Container(
    height: 150.h,
    margin: EdgeInsets.symmetric(horizontal: 15.w),
    padding: const EdgeInsets.all(35),
    decoration: BoxDecoration(
      color: const Color(0xffF2F2F2),
      borderRadius: BorderRadius.circular(11),
      border: Border.all(
        color: const Color(0xffF2F2F2),
        width: 1.2.w,
      ),
    ),
    child: Row(
      children: [
        Obx(() => CircleAvatar(
              radius: 35,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: controller.profileImage.value != null
                  ? FileImage(controller.profileImage.value!) as ImageProvider
                  : (controller.profilePictureUrl.value.isNotEmpty
                      ? NetworkImage(controller.profilePictureUrl.value)
                      : const NetworkImage("https://picsum.photos/200") as ImageProvider),
            )),
        SizedBox(width: 25.w),
        Obx(() => Text(
              controller.username.value,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            )),
      ],
    ),
  );
}

Widget _accountInformation(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        child: Text(
          "Account Information",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(height: 4.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            Container(
              height: 4.h,
              color: const Color(0xffE3E0E0),
            ),
            SizedBox(height: 4.h),
          ],
        ),
      ),
      _itemTile(
        label: "Update Profile",
        iconPath: IconPath.updateProfileIcon,
        trailing: Image.asset(
          IconPath.editIcon,
          height: 20.h,
          width: 20.w,
        ),
        onTap: () {
          Get.toNamed(AppRoute.getUpdateProfileScreen());
        },
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            SizedBox(height: 2.h),
            Container(
              height: 2.h,
              color: const Color(0xffE3E0E0),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
      _itemTile(
        label: "Password",
        iconPath: IconPath.passwordIcon,
        subtitle: "****************",
        trailing: Image.asset(
          IconPath.editIcon,
          height: 20.h,
          width: 20.w,
        ),
        onTap: () {
          Get.dialog(
            UpdatePasswordDialog(),
            barrierDismissible: false,
          );
        },
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            Container(
              height: 2.h,
              color: const Color(0xffE3E0E0),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
      _itemTile(
        label: "Terms & Conditions",
        iconPath: IconPath.privacyPolicyIcon,
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
        onTap: () {
          Get.toNamed(AppRoute.getTermsAndConditionScreen());
        },
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            SizedBox(height: 2.h),
            Container(
              height: 2.h,
              color: const Color(0xffE3E0E0),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
      _itemTile(
        label: "Privacy Policy",
        iconPath: IconPath.privacyPolicyIcon,
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
        onTap: () {
          Get.toNamed(AppRoute.getPrivacyPolicyScreen());
        },
      ),
    ],
  );
}

Widget _itemTile({
  required String label,
  required String iconPath,
  String? subtitle,
  Widget? trailing,
  VoidCallback? onTap,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 18),
    leading: Image.asset(
      iconPath,
      height: 28.h,
      width: 28.w,
    ),
    title: Text(
      label,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
    subtitle: subtitle != null ? Text(subtitle) : null,
    trailing: trailing,
    onTap: onTap,
  );
}