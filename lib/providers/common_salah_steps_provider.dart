import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:salah_learning_prayer/data/common_salah_data.dart';
import 'package:salah_learning_prayer/models/common_salah_model.dart';
import '../models/gender.dart';
import 'gender_provider.dart';

/// ================= STEP INDEX =================
/// Controls next / previous step
final demoStepIndexProvider = StateProvider<int>((ref) => 0);


/// ================= DEMO STEPS =================
/// Builds ONLY common salah demo steps
final demoPrayerStepsProvider = Provider<List<DemoPrayerStep>>((ref) {

  final gender = ref.watch(genderProvider);

  /// fallback safety
  final selectedGender = gender ?? Gender.male;

  return buildDemoSteps(selectedGender);
});


/// ================= AUTO RESET =================
/// When gender changes → restart from step 1
final demoResetIndexProvider = Provider<void>((ref) {

  ref.listen<Gender?>(genderProvider, (previous, next) {
    if (previous != next) {
      ref.read(demoStepIndexProvider.notifier).state = 0;
    }
  });

});