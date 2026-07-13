class MessegeModel {
  final int id;
  final List<Participant> participants;
  final String lastMessageContent;
  final int unreadCount;
  final String createdAt;

  MessegeModel({
    required this.id,
    required this.participants,
    required this.lastMessageContent,
    required this.unreadCount,
    required this.createdAt,
  });

  factory MessegeModel.fromJson(Map<String, dynamic> json) {
    String messageContent = "";
    if (json['last_message'] != null && json['last_message'] is Map) {
      messageContent = json['last_message']['content'] ?? '';
    } else if (json['last_message'] != null && json['last_message'] is String) {
      messageContent = json['last_message'];
    }

    return MessegeModel(
      id: json['id'] ?? 0,
      participants: (json['participants'] as List? ?? [])
          .map((e) => Participant.fromJson(e))
          .toList(),
      lastMessageContent: messageContent,
      unreadCount: json['unread_count'] ?? 0,
      createdAt: json['created_at'] ?? '',
    );
  }
}

class Participant {
  final int id;
  final String name;
  final String email;
  final String profilePicture;

  Participant({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePicture,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profilePicture: json['profile_picture'] ?? '',
    );
  }
}