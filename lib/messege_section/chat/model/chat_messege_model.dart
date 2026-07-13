// class ChatMessageModel {
//   final int id;
//   final int senderId;
//   final String content;
//   final String createdAt;

//   ChatMessageModel({
//     required this.id,
//     required this.senderId,
//     required this.content,
//     required this.createdAt,
//   });

//   factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
//     return ChatMessageModel(
//       id: json['id'] ?? 0,
//       senderId: json['sender_id'] ?? 0,
//       content: json['content'] ?? '',
//       createdAt: json['created_at'] ?? '',
//     );
//   }
// }

class ChatMessageModel {
  final int id;
  final int senderId;
  final String content;
  final String createdAt;

  ChatMessageModel({
    required this.id,
    required this.senderId,
    required this.content,
    required this.createdAt,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'] ?? json['message_id'] ?? 0,
      senderId: json['sender_id'] ?? 0,
      content: json['content'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender_id': senderId,
      'content': content,
      'created_at': createdAt,
    };
  }
}