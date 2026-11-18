import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
}

class PrayerAlarmScreen extends ConsumerWidget {
  const PrayerAlarmScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final alarms = ref.watch(prayerAlarmProvider);
    final notifier = ref.read(prayerAlarmProvider.notifier);

    final prayers = alarms.keys.toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Prayer Time Alarm"),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: prayers.length,
        itemBuilder: (_, i) {

          final prayer = prayers[i];

          return SwitchListTile(
            title: Text(prayer),
            subtitle: const Text("Notify at prayer time"),
            value: alarms[prayer]!,
            onChanged: (val) {
            
              notifier.toggle(prayer, val);
            },
            activeColor: const Color(0xFF016568),
          );
        },
      ),
    );
  }
}
