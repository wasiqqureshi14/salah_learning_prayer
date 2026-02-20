import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/gender.dart';

final genderProvider =
    NotifierProvider<GenderNotifier, Gender?>(
        GenderNotifier.new);

class GenderNotifier extends Notifier<Gender?> {

  static const _key = 'gender';

  @override
  Gender? build() {
    _loadGender();
    return null; // first launch = no gender
  }

  /// Load saved gender (runs once at startup)
  Future<void> _loadGender() async {
    final prefs = await SharedPreferences.getInstance();
    final savedGender = prefs.getString(_key);

    if (savedGender == 'male') {
      state = Gender.male;
    } else if (savedGender == 'female') {
      state = Gender.female;
    } else {
      state = null; // new user only
    }
  }

  /// Called when user selects gender
  Future<void> setGender(Gender gender) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      _key,
      gender == Gender.male ? 'male' : 'female',
    );

    state = gender; // triggers rebuild once
  }
}