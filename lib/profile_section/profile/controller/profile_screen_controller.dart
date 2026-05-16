import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  // Observables
  var username = "USER123".obs;
  var profileImage = Rxn<File>();

  final ImagePicker _picker = ImagePicker();

  // Future<void> pickProfileImage() async {
  //   var imageSource = ImageSource;
  //   final pickedFile = await _picker.pickImage(source: imageSource.gallery);
  //   if (pickedFile != null) {
  //     profileImage.value = File(pickedFile.path);
  //   }
  // }
  Future<void> pickProfileImage() async {
  // Pass the source directly from the ImageSource enum
  final pickedFile = await _picker.pickImage(source: ImageSource.gallery); 
  
  if (pickedFile != null) {
    profileImage.value = File(pickedFile.path);
  }
}

  void logout() {
    // Logic for logging out
    print("User logged out");
  }
}