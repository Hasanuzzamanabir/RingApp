// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart'; 
// import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
// import 'package:orange/core/utils/constants/custom_text.dart';
// import 'package:orange/core/widgets/custom_image_background.dart';
// import 'package:orange/profile_section/member_status/controller/member_status_controller.dart';

// import '../../../../core/utils/constants/app_colors.dart';

// class MemberStatusScreen extends StatelessWidget {
//   const MemberStatusScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(MemberStatusController());

//     return BackgroundImageScaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
                
//                   CustomBackButtonwidget(),
//                   Expanded(
//                     child: Center(
//                       child: Text(
//                         "Member Status",
//                         style: TextStyle(
//                           fontSize: 19.sp,
//                           color: AppColors.readColor,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 40.h),

//               /// 🔹 Horizontal Scrollable Cards
//               SizedBox(
//                 height: 405.h,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: controller.memberData.length,
//                   itemBuilder: (context, index) {
//                     final data = controller.memberData[index];

//                     return Container(
//                       width: 350.w,
//                       margin: const EdgeInsets.only(right: 16),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: AppColors.textWhite.withOpacity(0.1), // shadow color logic
//                             blurRadius: 8.7,
//                             spreadRadius: 0,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: 140.h,
//                             decoration: const BoxDecoration(
//                               borderRadius: BorderRadius.vertical(
//                                 top: Radius.circular(16),
//                               ),
//                               gradient: LinearGradient(
//                                 colors: [
//                                   Color(0xFF3C8CE7),
//                                   Color(0xFF00EAFF),
//                                 ],
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                               ),
//                             ),
//                             padding: const EdgeInsets.all(16),
//                             width: double.infinity,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(height: 4.h),
//                                 Text(
//                                   "Ring Name",
//                                   style: TextStyle(
//                                     color: Colors.white70,
//                                     fontSize: 14.sp,
//                                   ),
//                                 ),
//                                 SizedBox(height: 14.h),
//                                 Text(
//                                   data['name']!,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 24.sp,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
                          
//                           Container(
//                             decoration: BoxDecoration(
//                               border: Border(
//                                 left: BorderSide(color: const Color(0xff817E7E).withOpacity(0.2), width: 0.7.w),
//                                 right: BorderSide(color: const Color(0xff817E7E).withOpacity(0.2), width: 0.7.w),
//                                 bottom: BorderSide(color: const Color(0xff817E7E).withOpacity(0.2), width: 0.7.w),
//                               ),
//                               borderRadius: const BorderRadius.only(
//                                 bottomLeft: Radius.circular(16),
//                                 bottomRight: Radius.circular(16),
//                               ),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(height: 8.h),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Ring Size",
//                                         style: TextStyle(
//                                           color: Colors.black54,
//                                           fontSize: 16.sp,
//                                         ),
//                                       ),
//                                       SizedBox(height: 4.h),
//                                       Text(
//                                         data['size']!,
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 20.sp,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                       SizedBox(height: 8.h),
//                                     ],
//                                   ),
//                                 ),
//                                 const Divider(),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       CustomText(text: "Account Type", fontSize: 13.sp, fontWeight: FontWeight.w400),
//                                       SizedBox(height: 12.h),
//                                       CustomText(text: "VIP, Brand Ambassador, Fundraiser", fontSize: 16.sp, fontWeight: FontWeight.w400),
//                                     ],
//                                   ),
//                                 ),
//                                 const Divider(),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Member Since",
//                                         style: TextStyle(
//                                           color: Colors.black54,
//                                           fontSize: 14.sp,
//                                         ),
//                                       ),
//                                       SizedBox(height: 4.h),
//                                       Text(
//                                         data['date']!,
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 20.sp,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; 
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/custom_text.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/profile_section/member_status/controller/member_status_controller.dart';
import '../../../../core/utils/constants/app_colors.dart';

class MemberStatusScreen extends StatelessWidget {
  const MemberStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MemberStatusController());

    return BackgroundImageScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CustomBackButtonwidget(),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Member Status",
                        style: TextStyle(
                          fontSize: 19.sp,
                          color: AppColors.readColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),

              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.memberData.isEmpty) {
                    return const Center(
                      child: CustomText(
                        text: "No membership status found",
                        fontSize: 16,
                      ),
                    );
                  }

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.memberData.length,
                    itemBuilder: (context, index) {
                      final membership = controller.memberData[index];
                      final items = membership['items'] as List<dynamic>? ?? [];
                      final hasItems = items.isNotEmpty;

                      final ringName = hasItems ? (items[0]['name'] ?? "") : "";
                      final ringSize = hasItems ? (items[0]['size'] ?? "") : "";
                      final membershipType = membership['membersip_type'] ?? "";
                      final memberSince = membership['member_since'] ?? "";

                      String formattedDate = memberSince.toString();
                      if (formattedDate.contains('T')) {
                        formattedDate = formattedDate.split('T')[0];
                      }

                      return Container(
                        width: 350.w,
                        margin: const EdgeInsets.only(right: 16, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.textWhite.withOpacity(0.1),
                              blurRadius: 8.7,
                              spreadRadius: 0,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 140.h,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF3C8CE7),
                                    Color(0xFF00EAFF),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              padding: const EdgeInsets.all(16),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 4.h),
                                  Text(
                                    "Ring Name",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 14.h),
                                  Text(
                                    ringName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: const Color(0xff817E7E).withOpacity(0.2), width: 0.7.w),
                                  right: BorderSide(color: const Color(0xff817E7E).withOpacity(0.2), width: 0.7.w),
                                  bottom: BorderSide(color: const Color(0xff817E7E).withOpacity(0.2), width: 0.7.w),
                                ),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8.h),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Ring Size",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          ringSize,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 8.h),
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(text: "Account Type", fontSize: 13.sp, fontWeight: FontWeight.w400),
                                        SizedBox(height: 12.h),
                                        CustomText(text: membershipType, fontSize: 16.sp, fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Member Since",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          formattedDate,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}