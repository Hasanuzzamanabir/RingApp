import 'dart:math';
import 'package:get/get.dart';

class MemberStatusController extends GetxController {
  final ringNames = ['Wingman', 'Lover', 'Guardian', 'Companion', 'Soulmate'];
  final ringSizes = ['8.50', '9.00', '9.75', '10.00', '10.50'];
  final dates = [
    'Jan 10, 2025',
    'Mar 21, 2025',
    'May 12, 2025',
    'Jul 8, 2025',
    'Sep 30, 2025',
  ];

  final List<Map<String, String>> memberData = [];

  @override
  void onInit() {
    super.onInit();
    _generateRandomData();
  }

  void _generateRandomData() {
    final random = Random();
    for (var name in ringNames) {
      memberData.add({
        'name': name,
        'size': ringSizes[random.nextInt(ringSizes.length)],
        'date': dates[random.nextInt(dates.length)],
      });
    }
  }
}