import 'package:get/get.dart';

class BottomNavController extends GetxController {
  // Observable index
  var currentIndex = 0.obs;

  void setIndex(int index) {
    currentIndex.value = index;
  }
}