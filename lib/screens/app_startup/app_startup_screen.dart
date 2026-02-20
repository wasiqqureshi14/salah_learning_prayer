import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/core/services/prayer_scheduler.dart';
import 'package:salah_learning_prayer/models/gender.dart';
import 'package:salah_learning_prayer/providers/gender_provider.dart';
import 'package:salah_learning_prayer/screens/gender_selection/gender_selection.dart';
import 'package:salah_learning_prayer/screens/home/home_screen.dart';

class AppStartup extends ConsumerWidget {
  const AppStartup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
 ref.watch(prayerSchedulerProvider);
    final gender = ref.watch(genderProvider);

    // while loading first frame
    if (gender == Gender.male || gender == Gender.female) {

      final notifier = ref.read(genderProvider.notifier);

     
      Future.microtask(() async {
        await Future.delayed(const Duration(milliseconds: 50));
      });

      return const HomeScreen();
    }

    return const GenderSelectionScreen();
  }
}
