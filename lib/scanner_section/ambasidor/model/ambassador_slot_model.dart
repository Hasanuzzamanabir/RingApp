class AmbassadorSlotModel {
  final int id;
  final DateTime startTime;
  final DateTime endTime;
  final bool isAvailable;
  final DateTime createdAt;

  AmbassadorSlotModel({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.isAvailable,
    required this.createdAt,
  });

  factory AmbassadorSlotModel.fromJson(Map<String, dynamic> json) {
    return AmbassadorSlotModel(
      id: json['id'] ?? 0,
      startTime: DateTime.tryParse(json['start_time'] ?? '') ?? DateTime.now(),
      endTime: DateTime.tryParse(json['end_time'] ?? '') ?? DateTime.now(),
      isAvailable: json['is_available'] ?? true,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }
}