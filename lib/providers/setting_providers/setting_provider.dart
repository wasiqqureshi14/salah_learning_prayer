import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/models/gender.dart';
import 'package:salah_learning_prayer/models/setting_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adhan/adhan.dart';
import 'package:geolocator/geolocator.dart';

final appSettingsProvider =
    AsyncNotifierProvider<AppSettingsNotifier, AppSettings>(
        AppSettingsNotifier.new);

class AppSettingsNotifier extends AsyncNotifier<AppSettings> {

  /// ================= BUILD =================
  @override
  Future<AppSettings> build() async {

    final prefs = await SharedPreferences.getInstance();

    final autoLocation =
        prefs.getBool("autoLocation") ?? true;

    final namazAlert =
        prefs.getBool("namazAlert") ?? true;

    final notifications =
        prefs.getBool("notifications") ?? true;

    final prayerCalculation =
        prefs.getBool("prayerCalculation") ?? true;

    Coordinates coordinates;
    String country = "Detecting...";

    /// ---------- LOCATION ----------
    if (autoLocation) {

      final position =
          await Geolocator.getCurrentPosition();

      coordinates =
          Coordinates(position.latitude, position.longitude);

      country = "Auto Detected";

    } else {

      final lat = prefs.getDouble("lat") ?? 21.4225;
      final lng = prefs.getDouble("lng") ?? 39.8262;

      coordinates = Coordinates(lat, lng);
      country = prefs.getString("country") ?? "Makkah";
    }

    /// ---------- TIMEZONE ----------
    final timezone =
        _calculateTimezone(coordinates.longitude);

    /// ---------- PRAYER CALCULATION ----------
    final calc = _getCalculation(country);

    return AppSettings(
      gender: prefs.getString("gender") == "female"
          ? Gender.female
          : Gender.male,

      language: prefs.getString("language") ?? "English",

      autoLocation: autoLocation,
      namazAlert: namazAlert,
      notifications: notifications,
      prayerCalculation: prayerCalculation,

      country: country,
      timezone: timezone,
      coordinates: coordinates,

      /// calculation info
      calculationMethod: calc["name"],
      fajrAngle: calc["fajr"],
      ishaAngle: calc["isha"],
    );
  }

  /// ================= TIMEZONE =================
  String _calculateTimezone(double longitude) {
    final offset = (longitude / 15).round();
    return "GMT ${offset >= 0 ? '+' : ''}$offset";
  }

  /// ================= CALCULATION METHOD =================
  Map<String, dynamic> _getCalculation(String country) {

    switch (country.toLowerCase()) {

      case "pakistan":
      case "india":
      case "bangladesh":
        return {
          "name": "Islamic University, Karachi",
          "fajr": 18.0,
          "isha": 18.0,
        };

      case "saudi arabia":
        return {
          "name": "Umm Al Qura, Makkah",
          "fajr": 18.5,
          "isha": 90.0,
        };

      default:
        return {
          "name": "Muslim World League",
          "fajr": 18.0,
          "isha": 17.0,
        };
    }
  }

  /// ================= UPDATE COUNTRY =================
  Future<void> updateManualLocation({
    required String country,
    required double lat,
    required double lng,
  }) async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("country", country);
    await prefs.setDouble("lat", lat);
    await prefs.setDouble("lng", lng);

    final tz = _calculateTimezone(lng);
    final calc = _getCalculation(country);

    state = AsyncData(
      state.requireValue.copyWith(
        country: country,
        timezone: tz,
        coordinates: Coordinates(lat, lng),
        calculationMethod: calc["name"],
        fajrAngle: calc["fajr"],
        ishaAngle: calc["isha"],
      ),
    );
  }

  /// ================= AUTO LOCATION =================
  Future<void> toggleAutoLocation(bool val) async {

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("autoLocation", val);

    state = const AsyncLoading();
    state = AsyncData(await build());
  }

  /// ================= LANGUAGE =================
  Future<void> updateLanguage(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("language", lang);

    state = AsyncData(
      state.requireValue.copyWith(language: lang),
    );
  }

  /// ================= GENDER =================
  Future<void> updateGender(Gender g) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("gender", g.name);

    state = AsyncData(
      state.requireValue.copyWith(gender: g),
    );
  }

  /// ================= NAMAZ ALERT =================
  Future<void> toggleNamazAlert(bool val) async {

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("namazAlert", val);

    state = AsyncData(
      state.requireValue.copyWith(namazAlert: val),
    );
  }

  /// ================= NOTIFICATIONS =================
  Future<void> toggleNotifications(bool val) async {

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("notifications", val);

    state = AsyncData(
      state.requireValue.copyWith(notifications: val),
    );
  }

  /// ================= PRAYER CALCULATION =================
  Future<void> togglePrayerCalculation(bool val) async {

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("prayerCalculation", val);

    state = AsyncData(
      state.requireValue.copyWith(
        prayerCalculation: val,
      ),
    );
  }
}
