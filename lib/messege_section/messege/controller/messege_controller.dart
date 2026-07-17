// import 'dart:developer';
// import 'package:get/get.dart';
// import 'package:orange/core/network/services/api_services.dart';
// import 'package:orange/messege_section/messege/model/messege_model.dart';

// class MessegeController extends GetxController {
//   final ApiServices _apiServices = ApiServices();

//   final RxList<MessegeModel> _allMessages = <MessegeModel>[].obs;
//   var messages = <MessegeModel>[].obs;
//   var isLoading = false.obs;
//   var selectedOption = ''.obs;
//   var creditBalance = 0.obs;

//   static const String _conversationsEndpoint = '/api/chat/conversations/';
//   static const String _creditsEndpoint = '/api/chat/credits/';

//   @override
//   void onInit() {
//     super.onInit();
//     fetchConversations();
//     fetchCreditBalance();
//   }

//   Future<void> fetchConversations() async {
//     try {
//       isLoading.value = true;
//       final response = await _apiServices.get(
//         _conversationsEndpoint,
//         requireAuth: true,
//       );

//       if (response.statusCode == 200) {
//         final List data = response.data ?? [];
//         final parsedList = data.map((e) => MessegeModel.fromJson(e)).toList();
//         _allMessages.assignAll(parsedList);
//         messages.assignAll(parsedList);
//       }
//     } catch (e) {
//       log("Error fetching conversations: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> fetchCreditBalance() async {
//     try {
//       final response = await _apiServices.get(
//         _creditsEndpoint,
//         requireAuth: true,
//       );

//       if (response.statusCode == 200) {
//         final data = response.data;
//         creditBalance.value = data['balance'] ?? 0;
//       }
//     } catch (e) {
//       log("Error fetching credit balance: $e");
//     }
//   }

//   void searchMessages(String query) {
//     if (query.isEmpty) {
//       messages.assignAll(_allMessages);
//     } else {
//       messages.assignAll(
//         _allMessages.where((msg) {
//           final targetName = msg.participants.isNotEmpty 
//               ? msg.participants[0].name.toLowerCase() 
//               : '';
//           return targetName.contains(query.toLowerCase());
//         }).toList()
//       );
//     }
//   }

//   void updateSelection(String option) {
//     selectedOption.value = option;
//   }
// }
import 'dart:developer';
import 'package:get/get.dart';
import 'package:orange/core/network/services/api_services.dart';
import 'package:orange/messege_section/messege/model/messege_model.dart';

class MessegeController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  final RxList<MessegeModel> _allMessages = <MessegeModel>[].obs;
  var messages = <MessegeModel>[].obs;
  var isLoading = false.obs;
  var selectedOption = ''.obs;
  var creditBalance = 0.obs;

  static const String _conversationsEndpoint = '/api/chat/conversations/';
  static const String _creditsEndpoint = '/api/chat/credits/';

  @override
  void onInit() {
    super.onInit();
    fetchConversations();
    fetchCreditBalance();
  }

  Future<void> fetchConversations() async {
    try {
      isLoading.value = true;
      final response = await _apiServices.get(
        _conversationsEndpoint,
        requireAuth: true,
      );

      if (response.statusCode == 200) {
        final List data = response.data ?? [];
        final parsedList = data.map((e) => MessegeModel.fromJson(e)).toList();
        _allMessages.assignAll(parsedList);
        messages.assignAll(parsedList);
      }
    } catch (e) {
      log("Error fetching conversations: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchCreditBalance() async {
    try {
      final response = await _apiServices.get(
        _creditsEndpoint,
        requireAuth: true,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        creditBalance.value = data['balance'] ?? 0;
      }
    } catch (e) {
      log("Error fetching credit balance: $e");
    }
  }
  Future<void> toggleBlockUser(String action, String userId) async {
  try {
    isLoading.value = true;
    final String url = '/api/chat/users/$userId/block/';
    dynamic response;

    if (action == 'Block') {
      response = await _apiServices.post(url, data: {}, requireAuth: true);
    } else if (action == 'Unblock') {
      response = await _apiServices.delete(url, requireAuth: true);
    }

    if (response != null && (response.statusCode == 201 || response.statusCode == 204)) {
      Get.snackbar(
        "Success", 
        "User ${action == 'Block' ? 'blocked' : 'unblocked'} successfully.",
        snackPosition: SnackPosition.BOTTOM
      );
      fetchConversations();
    }
  } catch (e) {
    log("Error processing $action: $e");
    Get.snackbar("Error", "Failed to $action user.", snackPosition: SnackPosition.BOTTOM);
  } finally {
    isLoading.value = false;
  }
}

  void searchMessages(String query) {
    if (query.trim().isEmpty) {
      messages.assignAll(_allMessages);
    } else {
      final lowercaseQuery = query.toLowerCase().trim();
      messages.assignAll(
        _allMessages.where((msg) {
          return msg.participants.any((p) => 
            p.name.toLowerCase().contains(lowercaseQuery)
          );
        }).toList()
      );
    }
  }
  Future<void> scanAndConnectUser(String qrSlug) async {
  try {
    isLoading.value = true;
    final response = await _apiServices.post(
      '/api/chat/scan/$qrSlug/',
      data: {},
      requireAuth: true,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar(
        "Success", 
        "Connected successfully!",
        snackPosition: SnackPosition.BOTTOM
      );
      fetchConversations();
    }
  } catch (e) {
    log("Error scanning QR code: $e");
    Get.snackbar("Error", "Failed to connect via QR code.", snackPosition: SnackPosition.BOTTOM);
  } finally {
    isLoading.value = false;
  }
}

  void updateSelection(String option) {
    selectedOption.value = option;
  }
}