import 'package:get/get.dart';

class UpdatePasswordController extends GetxController {
  // পাসওয়ার্ড ভ্যালুগুলো
  var presentPassword = ''.obs;
  var newPassword = ''.obs;
  var confirmPassword = ''.obs;

  // Visibility States
  var isPresentVisible = false.obs;
  var isNewVisible = false.obs;
  var isConfirmVisible = false.obs;

  void setPresentPassword(String val) => presentPassword.value = val;
  void setNewPassword(String val) => newPassword.value = val;
  void setConfirmPassword(String val) => confirmPassword.value = val;

  void togglePresentVisibility() => isPresentVisible.value = !isPresentVisible.value;
  void toggleNewVisibility() => isNewVisible.value = !isNewVisible.value;
  void toggleConfirmVisibility() => isConfirmVisible.value = !isConfirmVisible.value;
}