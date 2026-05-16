// lib/bottom_nav/view/bottom_nav_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orange/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import 'package:orange/messege_section/messege/view/messege_screen.dart';
import 'package:orange/profile_section/profile/view/profile_screen.dart';
import 'package:orange/scanner_section/scanner/view/scanner_screen.dart';


// Import your new controller

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final BottomNavController controller = Get.put(BottomNavController());

    final List<Widget> pages = [
      const ProfileScreen(),
      const MessegeScreen(),
      const ScannerScreen(),
    ];

    return Scaffold(
      // Obx updates the body whenever currentIndex changes
      body: Obx(() => pages[controller.currentIndex.value]),
      
      bottomNavigationBar: Container(
        height: 100.h,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          child: Obx(
            () => BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: controller.setIndex,
              backgroundColor: Colors.black,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.white,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Message',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.qr_code_scanner),
                  label: 'Scanner',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}