import 'gender.dart';
import 'package:adhan/adhan.dart';

class AppSettings {

  final Gender gender;
  final String language;
  final bool autoLocation;

  final bool namazAlert;
  final bool notifications;
  final bool prayerCalculation;
  final String calculationMethod;
  final double fajrAngle;
  final double ishaAngle;

  final String country;
  final String timezone;

  final Coordinates coordinates;

  const AppSettings({
    required this.gender,
    required this.language,
    required this.autoLocation,
    required this.namazAlert,
    required this.prayerCalculation,
    required this.calculationMethod,
    required this.fajrAngle,
    required this.ishaAngle,
    required this.notifications,
    required this.country,
    required this.timezone,
    required this.coordinates,
  });

  AppSettings copyWith({
    Gender? gender,
    String? language,
    bool? autoLocation,
    bool? namazAlert,
    bool? notifications,
   bool? prayerCalculation,
  String? calculationMethod,
  double? fajrAngle,
  double? ishaAngle,
    String? country,
    String? timezone,
    Coordinates? coordinates,
  }) {
    return AppSettings(
      gender: gender ?? this.gender,
      language: language ?? this.language,
      autoLocation: autoLocation ?? this.autoLocation,
      namazAlert: namazAlert ?? this.namazAlert,
      notifications: notifications ?? this.notifications,
      prayerCalculation: prayerCalculation ?? this.prayerCalculation,
      calculationMethod: calculationMethod ?? this.calculationMethod,
      fajrAngle: fajrAngle ?? this.fajrAngle,
      ishaAngle: ishaAngle ?? this.ishaAngle,
      country: country ?? this.country,
      timezone: timezone ?? this.timezone,
      coordinates: coordinates ?? this.coordinates,
    );
  }
}
