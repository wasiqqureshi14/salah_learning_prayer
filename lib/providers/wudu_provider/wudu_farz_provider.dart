import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:salah_learning_prayer/data/wudu_farz_data.dart';
import 'package:salah_learning_prayer/models/wudu_farz_model.dart';


final wuduFarzStepsProvider =
    StateProvider<List<WuduFarzStep>>(
  (ref) => wuduFarzSteps,
);

final wuduFarzCurrentStepIndexProvider =
    StateProvider<int>((ref) => 0);


final currentWuduFarzStepProvider =
    Provider<WuduFarzStep>((ref) {

  final steps = ref.watch(wuduFarzStepsProvider);
  final index = ref.watch(wuduFarzCurrentStepIndexProvider);

  return steps[index];
});


void goToNextWuduFarzStep(WidgetRef ref) {

  final index =
      ref.read(wuduFarzCurrentStepIndexProvider);

  final steps =
      ref.read(wuduFarzStepsProvider);

  if (index < steps.length - 1) {
    ref
        .read(wuduFarzCurrentStepIndexProvider.notifier)
        .state++;
  }
}


void goToPreviousWuduFarzStep(WidgetRef ref) {

  final index =
      ref.read(wuduFarzCurrentStepIndexProvider);

  if (index > 0) {
    ref
        .read(wuduFarzCurrentStepIndexProvider.notifier)
        .state--;
  }
}


void resetWuduFarzSteps(WidgetRef ref) {
  ref
      .read(wuduFarzCurrentStepIndexProvider.notifier)
      .state = 0;
}
