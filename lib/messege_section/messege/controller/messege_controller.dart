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

  static const String _conversationsEndpoint = '/api/chat/conversations/';

  @override
  void onInit() {
    super.onInit();
    fetchConversations();
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

  void searchMessages(String query) {
    if (query.isEmpty) {
      messages.assignAll(_allMessages);
    } else {
      messages.assignAll(
        _allMessages.where((msg) {
          final targetName = msg.participants.isNotEmpty 
              ? msg.participants[0].name.toLowerCase() 
              : '';
          return targetName.contains(query.toLowerCase());
        }).toList()
      );
    }
  }

  void updateSelection(String option) {
    selectedOption.value = option;
  }
}