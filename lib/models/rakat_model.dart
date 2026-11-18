import 'prayer_step.dart';

class Rakat {
  final int number;
  final String type; // Sunnah Farz Nafl
  final List<PrayerStep> steps;

  Rakat({
    required this.number,
    required this.type,
    required this.steps,
  });
}
