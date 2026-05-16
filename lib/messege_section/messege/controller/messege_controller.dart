import 'package:get/get.dart';
import 'package:orange/messege_section/messege/model/messege_model.dart';

class MessegeController extends GetxController {
 
  final List<MessegeModel> _allMessages = [
    MessegeModel(
        userName: 'User 123',
        lastMessage: 'Start Conversation via QR Scan',
        time: 'Now',
        isOnline: true),
    MessegeModel(
        userName: 'User 456',
        lastMessage: 'Start Conversation via QR Scan',
        time: '8.00 pm'),
    MessegeModel(
        userName: 'User 789',
        lastMessage: 'Start Conversation via QR Scan',
        time: 'Now'),
  ];

  var messages = <MessegeModel>[].obs;
  
  var selectedOption = ''.obs;

  @override
  void onInit() {
    super.onInit();
    messages.assignAll(_allMessages);
  }

  void searchMessages(String query) {
    if (query.isEmpty) {
      messages.assignAll(_allMessages);
    } else {
      messages.assignAll(
        _allMessages.where((msg) =>
            msg.userName.toLowerCase().contains(query.toLowerCase())).toList()
      );
    }
  }

  void updateSelection(String option) {
    selectedOption.value = option;
  }
}