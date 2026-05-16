import 'package:get/get.dart';

class RingExchangeController extends GetxController {
  // Observables (State)
  var ringSize = ''.obs;
  var isLoading = false.obs;
  var error = RxnString();
  

  // Methods (Actions)
  void setRingExchangeSize(String value) {
    ringSize.value = value;
  }

  void clearError() {
    error.value = null;
  }

  void resetState() {
    ringSize.value = '';
    isLoading.value = false;
    error.value = null;
  }
}