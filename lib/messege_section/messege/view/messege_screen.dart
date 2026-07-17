
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart'; 
// import 'package:orange/core/utils/constants/icon_path.dart';
// import 'package:orange/core/widgets/custom_image_background.dart';
// import 'package:orange/messege_section/messege/controller/messege_controller.dart';
// import 'package:orange/messege_section/messege/model/messege_model.dart';
// import 'package:orange/messege_section/qr_code_scan/view/qr_code_scan.dart';
// import 'package:orange/messege_section/widgets/limited_credit_widget.dart';
// import 'package:orange/routes/app_routes.dart';

// class MessegeScreen extends StatelessWidget {
//   const MessegeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(MessegeController());

//     return BackgroundImageScaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.h),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(width: 100.w),
//                   Text(
//                     "Messages",
//                     style: TextStyle(
//                       color: Colors.red,
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(width: 20.w),
//                   GestureDetector(
//                     onTap: () {
//                       Get.dialog(
//                         const LimitedCreditDialog(),
//                         barrierDismissible: false,
//                       );
//                     },
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [Color(0xffFF868A), Color(0xffEC2028)],
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Row(
//                         children: [
//                           Image.asset(IconPath.cuponIcon, height: 20.h, width: 20.w),
//                           SizedBox(width: 10.w),
//                           const Text(
//                             "20",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 20.h),

//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0.w),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey.shade300, width: 1.w),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: TextField(
//                   onChanged: controller.searchMessages,
//                   decoration: InputDecoration(
//                     hintText: "Search conversations...",
//                     hintStyle: TextStyle(
//                       color: const Color(0xff9C9C9C),
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     prefixIcon: const Icon(Icons.search),
//                     filled: true,
//                     fillColor: const Color(0xffF3F4F6),
//                     border: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 12.h),

//             Expanded(
//               child: Obx(() {
//                 if (controller.isLoading.value) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 if (controller.messages.isEmpty) {
//                   return const Center(
//                     child: Text(
//                       "No conversations available",
//                       style: TextStyle(fontSize: 16, color: Colors.grey),
//                     ),
//                   );
//                 }

//                 return ListView.builder(
//                   padding: EdgeInsets.symmetric(horizontal: 16.w),
//                   itemCount: controller.messages.length,
//                   itemBuilder: (context, index) {
//                     final msg = controller.messages[index];
                    
//                     final targetUser = msg.participants.firstWhere(
//                       (p) => p.name.toLowerCase() != "abir hasan",
//                       orElse: () => msg.participants.isNotEmpty ? msg.participants[0] : Participant(id: 0, name: 'Unknown', email: '', profilePicture: '')
//                     );
                    
//                     final displayName = targetUser.name;
//                     final displayId = targetUser.id.toString();

//                     String formattedTime = msg.createdAt;
//                     if (formattedTime.contains('T')) {
//                       final timePart = formattedTime.split('T')[1].substring(0, 5);
//                       formattedTime = timePart; 
//                     }

//                     return GestureDetector(
//                       onTap: () async {
//                         await Get.toNamed(
//                           AppRoute.chatScreen,
//                           arguments: {
//                             'name': displayName, 
//                             "userId": displayId,
//                             "conversationId": msg.id.toString()
//                           },
//                         );
//                         controller.fetchConversations();
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.only(bottom: 8, top: 8),
//                         margin: const EdgeInsets.only(bottom: 12),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(width: 1, color: Colors.black12),
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.08),
//                               spreadRadius: 1,
//                               blurRadius: 8,
//                               offset: const Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: ListTile(
//                           contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
//                           leading: Stack(
//                             children: [
//                               CircleAvatar(
//                                 backgroundColor: Colors.red.shade300,
//                                 radius: 24,
//                                 child: Text(
//                                   displayName.isNotEmpty 
//                                       ? displayName.substring(0, 1).toUpperCase() 
//                                       : 'U',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 26.sp,
//                                   ),
//                                 ),
//                               ),
//                               if (msg.unreadCount > 0)
//                                 Positioned(
//                                   bottom: 0,
//                                   right: 0,
//                                   child: Container(
//                                     padding: const EdgeInsets.all(4),
//                                     decoration: BoxDecoration(
//                                       color: Colors.green,
//                                       shape: BoxShape.circle,
//                                       border: Border.all(color: Colors.white, width: 1.5),
//                                     ),
//                                     child: Text(
//                                       msg.unreadCount.toString(),
//                                       style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ),
//                             ],
//                           ),
//                           title: Text(
//                             displayName,
//                             style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
//                           ),
//                           subtitle: Text(
//                             msg.lastMessageContent.isNotEmpty ? msg.lastMessageContent : "Tap to start conversation",
//                             style: TextStyle(
//                               color: msg.unreadCount > 0 ? Colors.black : const Color(0xff746B6B), 
//                               fontSize: 12.sp,
//                               fontWeight: msg.unreadCount > 0 ? FontWeight.bold : FontWeight.normal
//                             ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           trailing: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               PopupMenuButton<String>(
//                                 color: Colors.red.shade300,
//                                 onSelected: controller.updateSelection,
//                                 itemBuilder: (context) => ['Block', 'Unblock']
//                                     .map((choice) => PopupMenuItem(value: choice, child: Text(choice)))
//                                     .toList(),
//                                 child: const Icon(Icons.more_vert, size: 20),
//                               ),
//                               Text(
//                                 formattedTime,
//                                 style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.red.shade300,
//         onPressed: () async {
//           final qrText = await Get.to(() => const QRScannerScreen());
//           if (qrText != null) {
//             debugPrint("QR CODE RESULT: $qrText");
//           }
//         },
//         child: const Icon(Icons.add, color: Colors.white),
//       ),
//     );
//   }
// // }
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart'; 
// import 'package:orange/core/utils/constants/icon_path.dart';
// import 'package:orange/core/widgets/custom_image_background.dart';
// import 'package:orange/messege_section/messege/controller/messege_controller.dart';
// import 'package:orange/messege_section/messege/model/messege_model.dart';
// import 'package:orange/messege_section/qr_code_scan/view/qr_code_scan.dart';
// import 'package:orange/messege_section/widgets/limited_credit_widget.dart';
// import 'package:orange/routes/app_routes.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MessegeScreen extends StatelessWidget {
//   const MessegeScreen({super.key});

//   Future<String> _getCurrentUserId() async {
//     final prefs = await SharedPreferences.getInstance();
//     final id = prefs.getString('user_id') ?? '';
//     log("DEBUG: Storage id -> '$id'");
//     return id;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(MessegeController());

//     return BackgroundImageScaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.h),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(width: 100.w),
//                   Text(
//                     "Messages",
//                     style: TextStyle(
//                       color: Colors.red,
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(width: 20.w),
//                   GestureDetector(
//                     onTap: () {
//                       Get.dialog(
//                         const LimitedCreditDialog(),
//                         barrierDismissible: false,
//                       );
//                     },
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
//                       decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           colors: [Color(0xffFF868A), Color(0xffEC2028)],
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Row(
//                         children: [
//                           Image.asset(IconPath.cuponIcon, height: 20.h, width: 20.w),
//                           SizedBox(width: 10.w),
//                           Obx(() => Text(
//                             "${controller.creditBalance.value}",
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           )),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 20.h),

//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0.w),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey.shade300, width: 1.w),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: TextField(
//                   onChanged: controller.searchMessages,
//                   decoration: InputDecoration(
//                     hintText: "Search conversations...",
//                     hintStyle: TextStyle(
//                       color: const Color(0xff9C9C9C),
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     prefixIcon: const Icon(Icons.search),
//                     filled: true,
//                     fillColor: const Color(0xffF3F4F6),
//                     border: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 12.h),

//             Expanded(
//               child: FutureBuilder<String>(
//                 future: _getCurrentUserId(),
//                 builder: (context, snapshot) {
//                   final currentUserId = snapshot.data ?? '';

//                   return Obx(() {
//                     if (controller.isLoading.value) {
//                       return const Center(child: CircularProgressIndicator());
//                     }

//                     if (controller.messages.isEmpty) {
//                       return const Center(
//                         child: Text(
//                           "No conversations available",
//                           style: TextStyle(fontSize: 16, color: Colors.grey),
//                         ),
//                       );
//                     }

//                     return ListView.builder(
//                       padding: EdgeInsets.symmetric(horizontal: 16.w),
//                       itemCount: controller.messages.length,
//                       itemBuilder: (context, index) {
//                         final msg = controller.messages[index];
                        
//                 final targetUser = msg.participants.firstWhereOrNull(
//   (p) => p.id.toString().trim() != currentUserId.trim() && 
//          p.name.toLowerCase() != "abir hasan",
// ) ?? (msg.participants.isNotEmpty ? msg.participants[0] : null);
                        
//                         log("DEBUG: My ID: $currentUserId | Target User: ${targetUser?.name}");
                        

//                         final displayName = targetUser?.name ?? 'Unknown';
//                         final displayId = targetUser?.id.toString() ?? '0';

//                         String formattedTime = msg.createdAt;
//                         if (formattedTime.contains('T')) {
//                           final timePart = formattedTime.split('T')[1].substring(0, 5);
//                           formattedTime = timePart; 
//                         }

//                         return GestureDetector(
//                           onTap: () async {
//                             await Get.toNamed(
//                               AppRoute.chatScreen,
//                               arguments: {
//                                 'name': displayName, 
//                                 "userId": displayId,
//                                 "conversationId": msg.id.toString()
//                               },
//                             );
//                             controller.fetchConversations();
//                             controller.fetchCreditBalance();
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.only(bottom: 8, top: 8),
//                             margin: const EdgeInsets.only(bottom: 12),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(width: 1, color: Colors.black12),
//                               borderRadius: BorderRadius.circular(12),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.08),
//                                   spreadRadius: 1,
//                                   blurRadius: 8,
//                                   offset: const Offset(0, 3),
//                                 ),
//                               ],
//                             ),
//                             child: ListTile(
//                               contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
//                               leading: Stack(
//                                 children: [
//                                   CircleAvatar(
//                                     backgroundColor: Colors.red.shade300,
//                                     radius: 24,
//                                     child: Text(
//                                       displayName.isNotEmpty 
//                                           ? displayName.substring(0, 1).toUpperCase() 
//                                           : 'U',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 26.sp,
//                                       ),
//                                     ),
//                                   ),
//                                   if (msg.unreadCount > 0)
//                                     Positioned(
//                                       bottom: 0,
//                                       right: 0,
//                                       child: Container(
//                                         padding: const EdgeInsets.all(4),
//                                         decoration: BoxDecoration(
//                                           color: Colors.green,
//                                           shape: BoxShape.circle,
//                                           border: Border.all(color: Colors.white, width: 1.5),
//                                         ),
//                                         child: Text(
//                                           msg.unreadCount.toString(),
//                                           style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
//                                         ),
//                                       ),
//                                     ),
//                                 ],
//                               ),
//                               title: Text(
//                                 displayName,
//                                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
//                               ),
//                               subtitle: Text(
//                                 msg.lastMessageContent.isNotEmpty ? msg.lastMessageContent : "Tap to start conversation",
//                                 style: TextStyle(
//                                   color: msg.unreadCount > 0 ? Colors.black : const Color(0xff746B6B), 
//                                   fontSize: 12.sp,
//                                   fontWeight: msg.unreadCount > 0 ? FontWeight.bold : FontWeight.normal
//                                 ),
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               trailing: Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   PopupMenuButton<String>(
//                                     color: Colors.red.shade300,
//                                     onSelected: controller.updateSelection,
//                                     itemBuilder: (context) => ['Block', 'Unblock']
//                                         .map((choice) => PopupMenuItem(value: choice, child: Text(choice)))
//                                         .toList(),
//                                     child: const Icon(Icons.more_vert, size: 20),
//                                   ),
//                                   Text(
//                                     formattedTime,
//                                     style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   });
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.red.shade300,
//         onPressed: () async {
//           final qrText = await Get.to(() => const QRScannerScreen());
//           if (qrText != null) {
//             debugPrint("QR CODE RESULT: $qrText");
//           }
//         },
//         child: const Icon(Icons.add, color: Colors.white),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; 
import 'package:orange/core/utils/constants/icon_path.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/messege_section/messege/controller/messege_controller.dart';
import 'package:orange/messege_section/qr_code_scan/view/qr_code_scan.dart';
import 'package:orange/messege_section/widgets/limited_credit_widget.dart';
import 'package:orange/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessegeScreen extends StatelessWidget {
  const MessegeScreen({super.key});

  Future<String> _getCurrentUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token') ?? prefs.getString('token') ?? '';
    
    if (token.isNotEmpty && token.contains('.')) {
      try {
        final parts = token.split('.');
        if (parts.length == 3) {
          final payload = utf8.decode(base64Url.decode(base64Url.normalize(parts[1])));
          final Map<String, dynamic> data = jsonDecode(payload);
          return data['user_id']?.toString() ?? '';
        }
      } catch (e) {
        log("Error decoding token: $e");
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MessegeController());

    return BackgroundImageScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 100.w),
                  Text(
                    "Messages",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  GestureDetector(
                    onTap: () {
                      Get.dialog(
                        const LimitedCreditDialog(),
                        barrierDismissible: false,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xffFF868A), Color(0xffEC2028)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Image.asset(IconPath.cuponIcon, height: 20.h, width: 20.w),
                          SizedBox(width: 10.w),
                          Obx(() => Text(
                            "${controller.creditBalance.value}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1.w),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  onChanged: controller.searchMessages,
                  decoration: InputDecoration(
                    hintText: "Search conversations...",
                    hintStyle: TextStyle(
                      color: const Color(0xff9C9C9C),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: const Color(0xffF3F4F6),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),

            Expanded(
              child: FutureBuilder<String>(
                future: _getCurrentUserId(),
                builder: (context, snapshot) {
                  final currentUserId = snapshot.data ?? '';

                  return Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (controller.messages.isEmpty) {
                      return const Center(
                        child: Text(
                          "No conversations available",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      );
                    }

                  return ListView.builder(
  padding: EdgeInsets.symmetric(horizontal: 16.w),
  itemCount: controller.messages.length,
  itemBuilder: (context, index) {
    final msg = controller.messages[index];
    
    final targetUser = msg.participants.firstWhereOrNull(
      (p) => p.id.toString().trim() != currentUserId.trim(),
    ) ?? (msg.participants.isNotEmpty ? msg.participants[0] : null);
    
    log("DEBUG: My ID: $currentUserId | Target User: ${targetUser?.name}");

    final displayName = targetUser?.name ?? 'Unknown';
    final displayId = targetUser?.id.toString() ?? '0';

                        String formattedTime = msg.createdAt;
                        if (formattedTime.contains('T')) {
                          final timePart = formattedTime.split('T')[1].substring(0, 5);
                          formattedTime = timePart; 
                        }

                        return GestureDetector(
                          onTap: () async {
                            await Get.toNamed(
                              AppRoute.chatScreen,
                              arguments: {
                                'name': displayName, 
                                "userId": displayId,
                                "conversationId": msg.id.toString()
                              },
                            );
                            controller.fetchConversations();
                            controller.fetchCreditBalance();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 8, top: 8),
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1, color: Colors.black12),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                              leading: Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.red.shade300,
                                    radius: 24,
                                    child: Text(
                                      displayName.isNotEmpty 
                                          ? displayName.substring(0, 1).toUpperCase() 
                                          : 'U',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26.sp,
                                      ),
                                    ),
                                  ),
                                  if (msg.unreadCount > 0)
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.white, width: 1.5),
                                        ),
                                        child: Text(
                                          msg.unreadCount.toString(),
                                          style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              title: Text(
                                displayName,
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                              ),
                              subtitle: Text(
                                msg.lastMessageContent.isNotEmpty ? msg.lastMessageContent : "Tap to start conversation",
                                style: TextStyle(
                                  color: msg.unreadCount > 0 ? Colors.black : const Color(0xff746B6B), 
                                  fontSize: 12.sp,
                                  fontWeight: msg.unreadCount > 0 ? FontWeight.bold : FontWeight.normal
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // trailing: Column(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   crossAxisAlignment: CrossAxisAlignment.end,
                              //   children: [
                              //     PopupMenuButton<String>(
                              //       color: Colors.red.shade300,
                              //       onSelected: controller.updateSelection,
                              //       itemBuilder: (context) => ['Block', 'Unblock']
                              //           .map((choice) => PopupMenuItem(value: choice, child: Text(choice)))
                              //           .toList(),
                              //       child: const Icon(Icons.more_vert, size: 20),
                              //     ),
                              //     Text(
                              //       formattedTime,
                              //       style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),
                              //     ),
                              //   ],
                              // ),
                              trailing: Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    PopupMenuButton<String>(
      color: Colors.red.shade300,
      onSelected: (choice) {
        controller.toggleBlockUser(choice, displayId);
      },
      itemBuilder: (context) => ['Block', 'Unblock']
          .map((choice) => PopupMenuItem(
                value: choice, 
                child: Text(choice, style: const TextStyle(color: Colors.white)),
              ))
          .toList(),
      child: const Icon(Icons.more_vert, size: 20),
    ),
    Text(
      formattedTime,
      style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),
    ),
  ],
),
                            ),
                          ),
                        );
                      },
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.red.shade300,
      //   onPressed: () async {
      //     final qrText = await Get.to(() => const QRScannerScreen());
      //     if (qrText != null) {
      //       debugPrint("QR CODE RESULT: $qrText");
      //     }
      //   },
      //   child: const Icon(Icons.add, color: Colors.white),
      // ),
      floatingActionButton: FloatingActionButton(
  backgroundColor: Colors.red.shade300,
  onPressed: () async {
    final qrText = await Get.to(() => const QRScannerScreen());
    if (qrText != null && qrText.toString().trim().isNotEmpty) {
      log("QR CODE RESULT: $qrText");
      await controller.scanAndConnectUser(qrText.toString().trim());
    }
  },
  child: const Icon(Icons.add, color: Colors.white),
),
    );
  }
}