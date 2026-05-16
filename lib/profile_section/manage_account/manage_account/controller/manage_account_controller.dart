import 'dart:io';

import 'package:get/get.dart';

class ManageAccountController extends GetxController {
  Rx<File?> image = Rx<File?>(null);

  RxString username = "John Doe".obs;

  void updateImage(File newImage) {
    image.value = newImage;
  }
}