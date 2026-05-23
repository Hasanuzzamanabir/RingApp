// import 'dart:developer';
// import 'dart:io';
// import 'package:dio/dio.dart' as dio;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:orange/core/network/services/api_services.dart'; 
// import 'package:orange/core/token/token_storage.dart';          

// class ProfileController extends GetxController {
//   final ApiServices _apiServices = ApiServices();
//   final ImagePicker _picker = ImagePicker();

//   var username = "USER123".obs; 
//   var email = "".obs;
//   var profileImage = Rxn<File>();        
//   var profilePictureUrl = "".obs;        
//   var isProfileLoading = false.obs;

//   static const String _profileEndpoint = '/api/auth/me/';

//   @override
//   void onInit() {
//     super.onInit();
//     fetchUserProfile(); 
//   }

//   Future<void> fetchUserProfile() async {
//     try {
//       isProfileLoading.value = true;
      
//       final response = await _apiServices.get(
//         _profileEndpoint,
//         requireAuth: true, 
//       );

//       if (response.statusCode == 200) {
//         final data = response.data;
        
//         username.value = data['name'] ?? "USER123";
//         email.value = data['email'] ?? "";
//         profilePictureUrl.value = data['profile_picture'] ?? "";
        
//         log("ProfileController: Profile synced -> ${username.value}");
//       }
//     } catch (e) {
//       log("Error fetching profile: $e");
//     } finally {
//       isProfileLoading.value = false;
//     }
//   }

//   Future<void> updateProfile() async {
//     try {
//       isProfileLoading.value = true;

//       final Map<String, dynamic> body = {
//         "name": username.value.trim(),
//       };

//       if (profileImage.value != null) {
//         body["profile_picture"] = await dio.MultipartFile.fromFile(
//           profileImage.value!.path,
//           filename: profileImage.value!.path.split('/').last,
//         );
//       }

//       final formData = dio.FormData.fromMap(body);

//       final response = await _apiServices.patch(
//         '/api/auth/me/', 
//         data: formData,
//         requireAuth: true,
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Get.back(); 
//         Get.snackbar(
//           "Success", 
//           "Profile updated successfully",
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.green.withOpacity(0.8),
//           colorText: Colors.white,
//         );
        
//         await fetchUserProfile();
//         profileImage.value = null; 
//       }
//     } catch (e) {
//       log("Error updating profile: $e");
//       Get.snackbar(
//         "Update Failed", 
//         "Something went wrong. Please try again.",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red.withOpacity(0.8),
//         colorText: Colors.white,
//       );
//     } finally {
//       isProfileLoading.value = false;
//     }
//   }

//   Future<void> pickProfileImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery); 
    
//     if (pickedFile != null) {
//       profileImage.value = File(pickedFile.path);
//     }
//   }

//   Future<void> logout() async {
//     log("User logging out. Clearing token storage...");
//     await TokenStorage.clearTokens();
//     Get.offAllNamed('/LoginScreen'); 
//   }
// }
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orange/core/network/services/api_services.dart';
import 'package:orange/core/token/token_storage.dart';

class ProfileController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final ImagePicker _picker = ImagePicker();

  var username = "USER123".obs;
  var email = "".obs;

  // LOCAL PICKED IMAGE
  var profileImage = Rxn<File>();

  // NETWORK IMAGE URL
  var profilePictureUrl = "".obs;

  var isProfileLoading = false.obs;

  static const String _profileEndpoint =
      '/api/auth/me/';

  @override
  void onInit() {
    super.onInit();

    fetchUserProfile();
  }

  // ================= FETCH PROFILE =================

  Future<void> fetchUserProfile() async {
    try {
      isProfileLoading.value = true;

      final response = await dio.Dio().get(
        "http://103.186.20.235:8005/api/auth/me/",
        options: dio.Options(
          headers: {
            "Authorization":
                "Bearer ${await TokenStorage.getAccessToken()}",
            "Cache-Control": "no-cache",
            "Pragma": "no-cache",
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        username.value =
            data['name'] ?? "USER123";

        email.value =
            data['email'] ?? "";

        // ================= IMAGE URL =================

        final imageUrl =
            data['profile_picture_local'] ??
                data['profile_picture'] ??
                "";

        if (imageUrl.toString().isNotEmpty) {

          // CACHE BUSTING
          profilePictureUrl.value =
              "$imageUrl?t=${DateTime.now().millisecondsSinceEpoch}";
        } else {
          profilePictureUrl.value = "";
        }

        log(
          "Profile synced -> ${username.value}",
        );

        log(
          "Image URL -> ${profilePictureUrl.value}",
        );
      }
    } catch (e) {
      log("Error fetching profile: $e");
    } finally {
      isProfileLoading.value = false;
    }
  }

  // ================= UPDATE PROFILE =================

  Future<void> updateProfile(
    String newName,
  ) async {
    try {
      isProfileLoading.value = true;

      final Map<String, dynamic> body = {
        "name": newName.trim(),
      };

      // ================= IMAGE =================

      if (profileImage.value != null) {

        log(
          "Selected Image Path => ${profileImage.value!.path}",
        );

        body["profile_picture_local"] =
    await dio.MultipartFile.fromFile(
          profileImage.value!.path,
          filename: profileImage.value!
              .path
              .split('/')
              .last,
        );
      }

      final formData =
          dio.FormData.fromMap(body);

      final response =
          await _apiServices.patch(
        _profileEndpoint,
        data: formData,
        requireAuth: true,
      );

      log(
        "UPDATE RESPONSE => ${response.data}",
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201) {

        // CLEAR LOCAL PICKED IMAGE
        profileImage.value = null;

        // FETCH UPDATED PROFILE
        await fetchUserProfile();

        // FORCE UPDATE
        update();

        Get.back();

        Get.snackbar(
          "Success",
          "Profile updated successfully",
          snackPosition:
              SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      log("Error updating profile: $e");

      Get.snackbar(
        "Error",
        "Profile update failed",
        snackPosition:
            SnackPosition.BOTTOM,
      );
    } finally {
      isProfileLoading.value = false;
    }
  }

  // ================= PICK IMAGE =================

  Future<void> pickProfileImage() async {
    final pickedFile =
        await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {

      profileImage.value =
          File(pickedFile.path);

      profileImage.refresh();

      log(
        "Selected Image => ${pickedFile.path}",
      );
    }
  }

  // ================= LOGOUT =================

  Future<void> logout() async {

    await TokenStorage.clearTokens();

    Get.offAllNamed('/LoginScreen');
  }
}