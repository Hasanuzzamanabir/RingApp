import 'package:get/get.dart';

class CreditPackage {
  final String name;
  final int credits;
  final String message;
  final String description;
  final double price;
  final bool isPopular;

  CreditPackage({
    required this.name,
    required this.credits,
    required this.message,
    required this.description,
    required this.price,
    this.isPopular = false,
  });
}

class PurchaseController extends GetxController {
  // Observables
  var availableCredits = 95.obs;
  var selectedPackage = Rxn<CreditPackage>();

  void selectPackage(CreditPackage package) {
    selectedPackage.value = package;
  }
}