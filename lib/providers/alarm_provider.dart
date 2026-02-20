
import 'package:flutter_riverpod/legacy.dart';

final prayerAlarmProvider =
    StateNotifierProvider<PrayerAlarmNotifier, Map<String, bool>>(
        (ref) => PrayerAlarmNotifier());

class PrayerAlarmNotifier extends StateNotifier<Map<String, bool>> {
  PrayerAlarmNotifier()
      : super({
          "Fajr": true,
          "Dhuhr": true,
          "Asr": true,
          "Maghrib": true,
          "Isha": true,
        });

  void toggle(String prayer, bool value) {
    state = {
      ...state,
      prayer: value,
    };
  }

  void setAll(bool value) {
    final updated = <String, bool>{};

    for (final key in state.keys) {
      updated[key] = value;
    }

    state = updated;
  }

  void updateJummah(bool shouldShow) {
    final newState = Map<String, bool>.from(state);

    if (shouldShow) {
      newState.putIfAbsent("Jummah", () => true);
    } else {
      newState.remove("Jummah");
    }

    state = newState;
  }
}
