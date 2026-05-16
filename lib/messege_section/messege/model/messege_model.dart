// lib/messages/model/message_model.dart
class MessegeModel {
  final String userName;
  final String lastMessage;
  final String time;
  final bool isOnline;

  MessegeModel({
    required this.userName,
    required this.lastMessage,
    required this.time,
    this.isOnline = false,
  });
}
