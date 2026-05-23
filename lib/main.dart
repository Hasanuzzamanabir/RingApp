import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:orange/app.dart';
import 'package:orange/core/token/token_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await TokenStorage.clearTokens();

  // Initialize AuthService
  // Get.put(AuthService());
  // Initialize CartController
  // Get.put(CartController());

  runApp(const orange());
}
