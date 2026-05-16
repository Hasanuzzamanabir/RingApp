import 'package:get/get.dart';
import 'package:orange/profile_section/profile/widget/log_out_dialouge_widget.dart';

class LogoutController extends GetxController {
  // Observable boolean for loading state
  var isLoading = false.obs;

  Future<void> logout() async {
    isLoading.value = true;
    
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));
    
    isLoading.value = false;

    // Show GetX Dialog
    Get.dialog(
      const LogoutSuccessDialog(),
      barrierDismissible: false,
    );
  }
}