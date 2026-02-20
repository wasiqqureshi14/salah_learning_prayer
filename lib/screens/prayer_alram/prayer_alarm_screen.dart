import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/models/gender.dart';
import 'package:salah_learning_prayer/providers/alarm_provider.dart';
import 'package:salah_learning_prayer/providers/gender_provider.dart';

class PrayerAlarmScreen extends ConsumerWidget {
  const PrayerAlarmScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final alarms = ref.watch(prayerAlarmProvider);
    final notifier = ref.read(prayerAlarmProvider.notifier);

    final gender = ref.watch(genderProvider);

    /// ⭐ Update Jummah safely
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifier.updateJummah(
        gender == Gender.male,
      );
    });

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
