import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // GetX Import
import 'package:orange/core/utils/constants/icon_path.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/messege_section/messege/controller/messege_controller.dart';
import 'package:orange/messege_section/qr_code_scan/view/qr_code_scan.dart';
import 'package:orange/messege_section/widgets/limited_credit_widget.dart';
import 'package:orange/routes/app_routes.dart';


class MessegeScreen extends StatelessWidget {
  const MessegeScreen({super.key});

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
                          const Text(
                            "20",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            /// --- SEARCH BAR ---
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

            /// --- MESSAGE LIST ---
            Expanded(
              child: Obx(() => ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      final msg = controller.messages[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                AppRoute.chatScreen,
                            arguments: {'name': msg.userName, "userId": "1"},
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 8,top: 8),
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
                                    msg.userName.substring(0, 1).toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26.sp,
                                    ),
                                  ),
                                ),
                                if (msg.isOnline)
                                  Positioned(
                                    bottom: 4,
                                    right: 0,
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 1.5),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            title: Text(
                              msg.userName,
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                            ),
                            // subtitle: Text(
                            //   msg.lastMessage,
                            //   style: TextStyle(color: const Color(0xff746B6B), fontSize: 11.sp),
                            // ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                PopupMenuButton<String>(
                                  color: Colors.red.shade300,
                                  onSelected: controller.updateSelection,
                                  itemBuilder: (context) => ['Block', 'Unblock']
                                      .map((choice) => PopupMenuItem(value: choice, child: Text(choice)))
                                      .toList(),
                                  child: const Icon(Icons.more_vert, size: 20),
                                ),
                                Text(
                                  msg.time,
                                  style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade300,
        onPressed: () async {
          final qrText = await Get.to(() => const QRScannerScreen());
          if (qrText != null) {
            debugPrint("QR CODE RESULT: $qrText");
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}