import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/app_colors.dart';
import 'package:orange/core/utils/constants/icon_path.dart';
import 'package:orange/core/widgets/app_snackbar.dart';
import 'package:orange/core/widgets/custom_button_widget.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/messege_section/purchase_text/controller/purchase_screen_controller.dart';
import 'package:orange/messege_section/purchase_text/widget/purchase_success_screen.dart';
import 'package:orange/messege_section/purchase_text/widget/purchase_un_successfull.dart';
 

class PurchaseTextCreditsScreen extends StatelessWidget {
  const PurchaseTextCreditsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject Controller
    final controller = Get.put(PurchaseController());

    List<CreditPackage> creditPackages = [
      CreditPackage(name: "500 Credits", credits: 500, message: '50 Messages', description: "Basic Support", price: 5.0),
      CreditPackage(name: "1000 Credits", credits: 100, message: '100 Messages', description: "Priority Support", price: 9.0, isPopular: true),
      CreditPackage(name: "2000 Credits", credits: 200, message: '200 Messages', description: "Priority Support", price: 15.0),
    ];

    return BackgroundImageScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButtonwidget(),
                  Text("Purchase Text Credits", 
                    style: TextStyle(color: Colors.red, fontSize: 18.sp, fontWeight: FontWeight.w700)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.w, color: const Color(0xffFF0000)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Image.asset(IconPath.cuponIcon, height: 20.h, width: 20.w, color: const Color(0xff3B82F6)),
                        SizedBox(width: 8.w),
                        Obx(() => Text("${controller.availableCredits.value}", 
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // Gradient Header Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 22.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [const Color(0xffEC2028).withOpacity(0.7), const Color(0xffEC2028)],
                    begin: Alignment.topCenter, end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Credits for Messaging", 
                      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: AppColors.textWhite)),
                    SizedBox(height: 10.h),
                    Text("Each message you send costs 1 credit. \nChoose a package that fits your needs.",
                      style: TextStyle(fontSize: 16.sp, color: AppColors.textWhite)),
                  ],
                ),
              ),
              SizedBox(height: 26.h),
              Text("Choose a Package", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView.builder(
                  itemCount: creditPackages.length,
                  itemBuilder: (context, index) {
                    final package = creditPackages[index];
                    return Obx(() {
                      final isSelected = controller.selectedPackage.value?.name == package.name;
                      return GestureDetector(
                        onTap: () => controller.selectPackage(package),
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                border: Border.all(
                                  width: 1.5.w,
                                  color: isSelected ? AppColors.readColor : Colors.white,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.08),
                                    blurRadius: 10, spreadRadius: 2, offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(vertical: 12.0.w, horizontal: 16.0.h),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Image.asset(IconPath.cuponIcon, height: 20.h, width: 20.h),
                                ),
                                title: Text(package.name, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                                subtitle: Wrap(
                                  spacing: 10.w, runSpacing: 6.h,
                                  children: [
                                   // _buildInfoTag(package.message),
                                    _buildInfoTag(package.description),
                                  ],
                                ),
                                trailing: CircleAvatar(
                                  radius: 25, backgroundColor: const Color(0xffD9D9D9),
                                  child: Text("\$ ${package.price.toStringAsFixed(0)}",
                                    style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800, color: Colors.black)),
                                ),
                              ),
                            ),
                            if (package.isPopular) _buildPopularBadge(),
                          ],
                        ),
                      );
                    });
                  },
                ),
              ),
              Obx(() => CustomButtonWidget(
                title: controller.selectedPackage.value != null ? "Purchase Now" : "Select Package", 
                onTap: () {
                  if (controller.selectedPackage.value == null) {
                    AppSnackBar.showError(context, "Please Select a package");
                  } else {
                    if (controller.selectedPackage.value?.name != "500 Credits") {
                      Get.to(() => const PurchaseUnSuccessScreen());
                    } else {
                      Get.to(() => const PurchaseSuccessScreen());
                    }
                  }
                },
              )),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(99), color: const Color(0xffD9D9D9)),
      child: Text(text, style: TextStyle(color: Colors.black, fontSize: 10.sp, fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildPopularBadge() {
    return Positioned(
      left: 15.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 2.h),
        decoration: BoxDecoration(color: const Color(0xffF97316), borderRadius: BorderRadius.circular(99)),
        child: Text("Popular", style: TextStyle(color: Colors.white, fontSize: 11.sp, fontWeight: FontWeight.w600)),
      ),
    );
  }
}