import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Message Model
class Message {
  final String sender;
  final String content;
  final DateTime timeSent;

  Message({
    required this.sender,
    required this.content,
    required this.timeSent,
  });
}

class ChatController extends GetxController {

  var messages = <Message>[].obs;
  final TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    _addInitialMessage();
  }

  void _addInitialMessage() {
    if (messages.isEmpty) {
      messages.add(
        Message(
          sender: 'John Doe',
          content: 'How are you?',
          timeSent: DateTime.now().subtract(const Duration(minutes: 1)),
        ),
      );
    }
  }

  void addMessage(String content) {
    if (content.trim().isNotEmpty) {
      messages.add(
        Message(
          sender: 'Molar', 
          content: content,
          timeSent: DateTime.now(),
        ),
      );
      textController.clear();
    }
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}