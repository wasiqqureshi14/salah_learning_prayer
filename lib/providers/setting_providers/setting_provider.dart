
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/models/gender.dart';
import 'package:salah_learning_prayer/models/setting_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adhan/adhan.dart';
import 'package:geolocator/geolocator.dart';

final appSettingsProvider =
    AsyncNotifierProvider<AppSettingsNotifier, AppSettings>(
        AppSettingsNotifier.new);

class AppSettingsNotifier
    extends AsyncNotifier<AppSettings> {

  @override
  Future<AppSettings> build() async {

    final prefs = await SharedPreferences.getInstance();

    final autoLocation =
        prefs.getBool("autoLocation") ?? true;

    Coordinates coordinates;
    String country = "Detecting...";
   final timezone =
    DateTime.now().timeZoneName;

    if (autoLocation) {

      final position =
          await Geolocator.getCurrentPosition();

      coordinates = Coordinates(
        position.latitude,
        position.longitude,
      );

      country = "Auto Detected";

    } else {

      final lat =
          prefs.getDouble("lat") ?? 21.4225;

      final lng =
          prefs.getDouble("lng") ?? 39.8262;

      coordinates = Coordinates(lat, lng);

      country =
          prefs.getString("country") ?? "Makkah";
    }

    return AppSettings(
      gender: prefs.getString("gender") == "female"
          ? Gender.female
          : Gender.male,
      language:
          prefs.getString("language") ?? "English",
      autoLocation: autoLocation,
      country: country,
      timezone: timezone,
      coordinates: coordinates,
    );
  }

  Future<void> updateGender(Gender g) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("gender", g.name);

    state = AsyncData(
        state.value!.copyWith(gender: g));
  }

  Future<void> updateLanguage(String lang) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("language", lang);

    state = AsyncData(
        state.value!.copyWith(language: lang));
  }

  Future<void> toggleAutoLocation(bool val) async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool("autoLocation", val);

    state = const AsyncLoading();

    state = AsyncData(await build());
  }

  Future<void> updateManualLocation({
    required String country,
    required double lat,
    required double lng,
  }) async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("country", country);
    await prefs.setDouble("lat", lat);
    await prefs.setDouble("lng", lng);

    state = AsyncData(
      state.value!.copyWith(
        country: country,
        coordinates: Coordinates(lat, lng),
      ),
    );
  }
}
