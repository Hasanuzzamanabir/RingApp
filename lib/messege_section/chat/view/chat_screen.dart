// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
// import 'package:orange/core/widgets/custom_image_background.dart';
// import 'package:orange/messege_section/widgets/limited_credit_widget.dart';
// import '../../../../core/utils/constants/icon_path.dart';
// import '../controller/chat_controller.dart';

// class ChatScreen extends StatelessWidget {
//   const ChatScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Controller Initialize
//     final ChatController chatController = Get.put(ChatController());

//     // Arguments handling
//     final dynamic args = Get.arguments;
//     final String name = args?['name'] ?? 'User';
//     final String userId = args?['userId'] ?? '';

//     return BackgroundImageScaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.h),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                  CustomBackButtonwidget(),
//                       Text(
//                         "Messages",
//                         style: TextStyle(
//                           color: Colors.red,
//                           fontSize: 20.sp,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Get.dialog(
//                             const LimitedCreditDialog(),
//                             barrierDismissible: false,
//                           );
//                         },
//                         child: Container(
//                           padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
//                           decoration: BoxDecoration(
//                             gradient: const LinearGradient(
//                               colors: [Color(0xffFF868A), Color(0xffEC2028)],
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                             ),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Row(
//                             children: [
//                               Image.asset(IconPath.cuponIcon, height: 20.h, width: 20.w),
//                               SizedBox(width: 10.w),
//                               Text(
//                                 "20",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16.sp,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 15.h),
//                   ListTile(
//                     contentPadding: EdgeInsets.zero,
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.red.shade300,
//                       radius: 22,
//                       child: Text(
//                         name.isNotEmpty ? name.substring(0, 1).toUpperCase() : "?",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20.sp,
//                         ),
//                       ),
//                     ),
//                     title: Text(
//                       name,
//                       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
//                     ),
//                     subtitle: Text(
//                       "Active",
//                       style: TextStyle(color: const Color(0xff746B6B), fontSize: 14.sp),
//                     ),
//                   )
//                 ],
//               ),
              
//             ),
//             SizedBox(height: 20.h),
            
//             // Messages List
//             Expanded(
//               child: Obx(() => ListView.builder(
//                     itemCount: chatController.messages.length,
//                     itemBuilder: (context, index) {
//                       final message = chatController.messages[index];
//                       bool isCurrentUser = message.sender == 'Molar';

//                       return Align(
//                         alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
//                           child: Column(
//                             crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "${isCurrentUser ? 'Mollar' : name} ${DateFormat('h:mm a').format(message.timeSent)}",
//                                 style: TextStyle(color: Colors.black54, fontSize: 12.sp),
//                               ),
//                               SizedBox(height: 5.h),
//                               Container(
//                                 decoration: BoxDecoration(
//                                   color: isCurrentUser ? const Color(0xffEE6767) : const Color(0xffF3F4F6),
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
//                                 child: Text(
//                                   message.content,
//                                   style: TextStyle(
//                                     color: isCurrentUser ? Colors.white : Colors.black,
//                                     fontSize: 16.sp,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   )),
//             ),
            
//             // Bottom Input Bar
//             Container(
//               height: 75.h,
//               decoration: const BoxDecoration(color: Color(0xffEE6767)),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.attach_file, color: Colors.white),
//                       onPressed: () {},
//                     ),
//                     Expanded(
//                       child: TextFormField(
//                         style: TextStyle(color: Colors.white, fontSize: 16.sp),
//                         controller: chatController.textController,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           enabledBorder: InputBorder.none,
//                           focusedBorder: InputBorder.none,
//                           filled: true,
//                           fillColor: Color(0xffEE6767),
//                           hintStyle: TextStyle(color: Colors.white70),
//                           hintText: 'Type your message here...',
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.send, color: Colors.white),
//                       onPressed: () {
//                         chatController.addMessage(chatController.textController.text);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/messege_section/widgets/limited_credit_widget.dart';
import 'package:orange/messege_section/messege/controller/messege_controller.dart';
import '../../../../core/utils/constants/icon_path.dart';
import '../controller/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.put(ChatController());
    final MessegeController messegeController = Get.find<MessegeController>();

    final dynamic args = Get.arguments;
    final String name = args?['name'] ?? 'User';

    return BackgroundImageScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomBackButtonwidget(),
                      Text(
                        "Messages",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                                "${messegeController.creditBalance.value}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Colors.red.shade300,
                      radius: 22,
                      child: Text(
                        name.isNotEmpty ? name.substring(0, 1).toUpperCase() : "?",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    title: Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
                    ),
                    subtitle: Text(
                      "Active",
                      style: TextStyle(color: const Color(0xff746B6B), fontSize: 14.sp),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            
            Expanded(
              child: Obx(() {
                if (chatController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (chatController.messages.isEmpty) {
                  return const Center(
                    child: Text(
                      "No messages yet",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  );
                }

                return ListView.builder(
                  reverse: true,
                  itemCount: chatController.messages.length,
                  itemBuilder: (context, index) {
                    final message = chatController.messages[index];
                    bool isCurrentUser = message.senderId == chatController.currentUserId;

                    String formattedTime = message.createdAt;
                    if (formattedTime.contains('T')) {
                      formattedTime = formattedTime.split('T')[1].substring(0, 5);
                    }

                    return Align(
                      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
                        child: Column(
                          crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${isCurrentUser ? 'You' : name} $formattedTime",
                              style: TextStyle(color: Colors.black54, fontSize: 12.sp),
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              decoration: BoxDecoration(
                                color: isCurrentUser ? const Color(0xffEE6767) : const Color(0xffF3F4F6),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
                              child: Text(
                                message.content,
                                style: TextStyle(
                                  color: isCurrentUser ? Colors.white : Colors.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            
            Container(
              height: 75.h,
              decoration: const BoxDecoration(color: Color(0xffEE6767)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.attach_file, color: Colors.white),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                        controller: chatController.textController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          filled: true,
                          fillColor: Color(0xffEE6767),
                          hintStyle: TextStyle(color: Colors.white70),
                          hintText: 'Type your message here...',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        chatController.addMessage(chatController.textController.text);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}