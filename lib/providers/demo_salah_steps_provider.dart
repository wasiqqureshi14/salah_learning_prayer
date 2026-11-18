import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:salah_learning_prayer/data/prayers_step_data.dart';
import 'package:salah_learning_prayer/models/gender.dart';
import '../models/prayer_step.dart';
import '../providers/gender_provider.dart';
/// ✅ Step Index Controller
final demoStepIndexProvider = StateProvider<int>((ref) => 0);


/// ✅ Demo 1 Rakat Steps
final demoPrayerStepsProvider = Provider<List<PrayerStep>>((ref) {

  final gender = ref.watch(genderProvider);
   final selectedGender = gender ?? Gender.male;

  return buildSteps(
    gender: selectedGender,
    isFirstRakat: true,
    isSecondRakat: false,
    isLastRakat: true, // 🔥 ensures Salam appears
    totalRakats: 1,
    isWitr: false,
  );
});


/// ✅ Reset index automatically when gender changes
final demoResetIndexProvider = Provider((ref) {
  ref.listen(genderProvider, (_, __) {
    ref.read(demoStepIndexProvider.notifier).state = 0;
  });
});
