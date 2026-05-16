import 'dart:io';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  // Reactive variables (State)
  var username = 'User 123'.obs;
  var image = Rxn<File>(); // Nullable reactive File
  var isLoading = false.obs;
  var error = ''.obs;

  // Methods to update state
  void updateUsername(String value) {
    username.value = value;
  }

  void updateImage(File file) {
    image.value = file;
  }
}