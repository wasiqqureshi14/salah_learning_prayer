import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/gender.dart';

final genderProvider =
    NotifierProvider<GenderNotifier, Gender>(
        GenderNotifier.new);

class GenderNotifier extends Notifier<Gender> {

  static const _key = 'gender';

  @override
  Gender build() {
    _loadGender();
    return Gender.male; // temporary default (1 frame only)
  }

  Future<void> _loadGender() async {
    final prefs = await SharedPreferences.getInstance();

    final savedGender = prefs.getString(_key);

    if (savedGender == 'female') {
      state = Gender.female;
    } else {
      state = Gender.male;
    }
  }

  Future<void> setGender(Gender gender) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      _key,
      gender == Gender.male ? 'male' : 'female',
    );

    state = gender;
  }
}
