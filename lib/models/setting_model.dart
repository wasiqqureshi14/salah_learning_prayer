import 'gender.dart';
import 'package:adhan/adhan.dart';

class AppSettings {

  final Gender gender;
  final String language;

  final bool autoLocation;

  final String country;
  final String timezone;

  final Coordinates coordinates;

  const AppSettings({
    required this.gender,
    required this.language,
    required this.autoLocation,
    required this.country,
    required this.timezone,
    required this.coordinates,
  });

  AppSettings copyWith({
    Gender? gender,
    String? language,
    bool? autoLocation,
    String? country,
    String? timezone,
    Coordinates? coordinates,
  }) {
    return AppSettings(
      gender: gender ?? this.gender,
      language: language ?? this.language,
      autoLocation: autoLocation ?? this.autoLocation,
      country: country ?? this.country,
      timezone: timezone ?? this.timezone,
      coordinates: coordinates ?? this.coordinates,
    );
  }
}
