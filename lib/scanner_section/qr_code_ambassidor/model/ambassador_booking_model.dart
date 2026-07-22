class AmbassadorBookingModel {
  final int id;
  final String user;
  final BookingSlot? slot;
  final String? completedAt;
  final String? ambassadorLink;
  final String? brandQr;
  final String createdAt;

  AmbassadorBookingModel({
    required this.id,
    required this.user,
    this.slot,
    this.completedAt,
    this.ambassadorLink,
    this.brandQr,
    required this.createdAt,
  });

  factory AmbassadorBookingModel.fromJson(Map<String, dynamic> json) {
    return AmbassadorBookingModel(
      id: json['id'] ?? 0,
      user: json['user'] ?? '',
      slot: json['slot'] != null ? BookingSlot.fromJson(json['slot']) : null,
      completedAt: json['completed_at'],
      ambassadorLink: json['ambassador_link'],
      brandQr: json['brand_qr'],
      createdAt: json['created_at'] ?? '',
    );
  }
}

class BookingSlot {
  final int id;
  final DateTime startTime;
  final DateTime endTime;
  final bool isAvailable;

  BookingSlot({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.isAvailable,
  });

  factory BookingSlot.fromJson(Map<String, dynamic> json) {
    return BookingSlot(
      id: json['id'] ?? 0,
      startTime: DateTime.tryParse(json['start_time'] ?? '') ?? DateTime.now(),
      endTime: DateTime.tryParse(json['end_time'] ?? '') ?? DateTime.now(),
      isAvailable: json['is_available'] ?? false,
    );
  }
}