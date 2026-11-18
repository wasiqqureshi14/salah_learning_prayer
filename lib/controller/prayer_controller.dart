
/*import 'package:flutter_riverpod/legacy.dart';
import 'package:salah_learning_prayer/data/prayers_step_data.dart';
import '../models/prayer_step.dart';


class PrayerState {
  final List<PrayerStep> steps;
  final int index;
  final int repeat;

  const PrayerState({
    required this.steps,
    required this.index,
    required this.repeat,
  });

  PrayerStep get currentStep => steps[index];

  PrayerState copyWith({
    List<PrayerStep>? steps,
    int? index,
    int? repeat,
  }) {
    return PrayerState(
      steps: steps ?? this.steps,
      index: index ?? this.index,
      repeat: repeat ?? this.repeat,
    );
  }
}




class PrayerController extends StateNotifier<PrayerState> {

  PrayerController()
      : super(
          const PrayerState(
            steps: [],
            index: 0,
            repeat: 1,
          ),
        );

  /// 🔥 MOVE IT HERE
  void startPrayer({
    required bool isFirstRakat,
    required bool isSecondRakat,
    required bool isLastRakat,
    required int totalRakats,
    required bool isWitr,
  }) {

    final steps = buildSteps(
      isFirstRakat: isFirstRakat,
      isSecondRakat: isSecondRakat,
      isLastRakat: isLastRakat,
      totalRakats: totalRakats,
      isWitr: isWitr,
    );

    /// THIS updates Riverpod
    state = PrayerState(
      steps: steps,
      index: 0,
      repeat: 1,
    );
  }



  void next() {
    final step = state.currentStep;

    if (state.repeat < step.repeat) {
      state = state.copyWith(repeat: state.repeat + 1);
      return;
    }

    if (state.index < state.steps.length - 1) {
      state = state.copyWith(
        index: state.index + 1,
        repeat: 1,
      );
    }
  }

  void previous() {
    if (state.index > 0) {
      state = state.copyWith(
        index: state.index - 1,
        repeat: 1,
      );
    }
  }
}

final prayerControllerProvider =
    StateNotifierProvider<PrayerController, PrayerState>(
        (ref) => PrayerController());
*/