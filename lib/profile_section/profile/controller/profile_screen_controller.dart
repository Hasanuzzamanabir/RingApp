
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

  var profileImage = Rxn<File>();

  var profilePictureUrl = "".obs;

  var isProfileLoading = false.obs;

  static const String _profileEndpoint = '/api/auth/me/';

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  // ================= FETCH PROFILE =================

  Future<void> fetchUserProfile() async {
    try {
      isProfileLoading.value = true;

      final response = await _apiServices.get(
        _profileEndpoint,
        requireAuth: true,
      );

      if (response.statusCode == 200) {
        final data = response.data;

        username.value = data['name'] ?? "USER123";
        email.value = data['email'] ?? "";

        final imageUrl = data['profile_picture_local'] ?? data['profile_picture'] ?? "";

        if (imageUrl.toString().isNotEmpty) {
          profilePictureUrl.value = "$imageUrl?t=${DateTime.now().millisecondsSinceEpoch}";
        } else {
          profilePictureUrl.value = "";
        }

        log("Profile synced -> ${username.value}");
        log("Image URL -> ${profilePictureUrl.value}");
      }
    } catch (e) {
      log("Error fetching profile: $e");
    } finally {
      isProfileLoading.value = false;
    }
  }
Future<void> updateProfile(String newName) async {
    if (newName.trim().isEmpty) {
      Get.snackbar("Required", "Name cannot be empty");
      return;
    }

    try {
      isProfileLoading.value = true;

      final Map<String, dynamic> body = {
        "name": newName.trim(),
      };

      if (profileImage.value != null) {
        log("Selected Image Path => ${profileImage.value!.path}");

        body["profile_picture_local"] = await _apiServices.multipartFile(profileImage.value!);
      }

      final formData = dio.FormData.fromMap(body);

      final response = await _apiServices.patch(
        _profileEndpoint,
        data: formData,
        requireAuth: true,
      );

      log("UPDATE RESPONSE => ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        profileImage.value = null;

        await fetchUserProfile();

        update();

        Get.back(); 

        Get.snackbar(
          "Success",
          "Profile updated successfully",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      log("Error updating profile: $e");
      Get.snackbar(
        "Error",
        "Profile update failed",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isProfileLoading.value = false;
    }
  }

  RxBool isPickingImage = false.obs;

  Future<void> pickProfileImage() async {
    if (isPickingImage.value) return;

    try {
      isPickingImage.value = true;

      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80, 
      );

      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
        profileImage.refresh();
        log("Selected Image => ${pickedFile.path}");
      }
    } catch (e) {
      log("Error picking image: $e");
    } finally {
      isPickingImage.value = false;
    }
  }

  // ================= LOGOUT =================

  Future<void> logout() async {
    log("User logging out. Clearing token storage...");
    await TokenStorage.clearTokens();
    Get.offAllNamed('/LoginScreen');
  }
}