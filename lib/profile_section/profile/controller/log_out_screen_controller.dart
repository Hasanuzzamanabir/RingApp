import 'package:get/get.dart';
import 'package:orange/core/token/token_storage.dart';
import 'package:orange/profile_section/profile/widget/log_out_dialouge_widget.dart';

class LogoutController extends GetxController {
  var isLoading = false.obs;

  Future<void> logout() async {
    isLoading.value = true;

    await TokenStorage.clearTokens();
    Get.deleteAll(force: true);

    isLoading.value = false;

    Get.dialog(
      const LogoutSuccessDialog(),
      barrierDismissible: false,
    );
  }
}