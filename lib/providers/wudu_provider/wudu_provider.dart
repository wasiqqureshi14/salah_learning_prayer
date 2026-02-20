import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:salah_learning_prayer/data/wudu_data.dart';
import 'package:salah_learning_prayer/models/wudu_model.dart';

/// All Wudu steps
final wuduStepsProvider =
    StateProvider<List<WuduStep>>((ref) => wuduSteps);

/// Current step index
final wuduCurrentStepIndexProvider =
    StateProvider<int>((ref) => 0);

/// Current step shortcut
final currentWuduStepProvider = Provider<WuduStep>((ref) {
  final steps = ref.watch(wuduStepsProvider);
  final index = ref.watch(wuduCurrentStepIndexProvider);
  return steps[index];
});

/// NEXT STEP LOGIC
void goToNextWuduStep(WidgetRef ref) {
  final index = ref.read(wuduCurrentStepIndexProvider);
  final steps = ref.read(wuduStepsProvider);

  if (index < steps.length - 1) {
    ref.read(wuduCurrentStepIndexProvider.notifier).state++;
  }
}

/// PREVIOUS STEP LOGIC
void goToPreviousWuduStep(WidgetRef ref) {
  final index = ref.read(wuduCurrentStepIndexProvider);

  if (index > 0) {
    ref.read(wuduCurrentStepIndexProvider.notifier).state--;
  }
}
