import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/data/prayers_step_data.dart';
import 'package:salah_learning_prayer/providers/prayer_steps_provider.dart';

class PrayerControlBar extends ConsumerWidget {
  const PrayerControlBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final steps = ref.watch(prayerStepsProvider);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF016568),
      
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          /// PREVIOUS BUTTON
          IconButton(
            icon: const Icon(
              Icons.skip_previous,
              color: Colors.white,
              size: 34,
            ),
            onPressed: () {

              final stepIndex = ref.read(currentStepIndexProvider);

              /// Move inside same rakat
              if (stepIndex > 0) {
                ref.read(currentStepIndexProvider.notifier).state--;
              }

              /// Go to previous rakat
              else {

                final currentRakat = ref.read(currentRakatProvider);

                if (currentRakat > 1) {

                  final prevRakat = currentRakat - 1;
                  final totalRakats = ref.read(totalRakatsProvider);
                  final rakatType = ref.read(rakatTypeProvider);

                  ref.read(currentRakatProvider.notifier).state = prevRakat;

                  ref.read(prayerStepsProvider.notifier).state =
                      buildSteps(
                        isFirstRakat: prevRakat == 1,
                        isSecondRakat: prevRakat == 2,
                        isLastRakat: prevRakat == totalRakats,
                        totalRakats: totalRakats,
                        isWitr: rakatType == 'Witr',
                      );

                  /// Jump to last step of previous rakat
                  ref.read(currentStepIndexProvider.notifier).state =
                      steps.length - 1;
                }
              }
            },
          ),

          const SizedBox(width: 12),

          /// CENTER PLAY BUTTON (Optional for audio later)
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.pause,
                color: Color(0xFF016568),
              ),
              onPressed: () {
                /// attach audio later if needed
              },
            ),
          ),

          const SizedBox(width: 12),

          /// NEXT BUTTON
          IconButton(
            icon: const Icon(
              Icons.skip_next,
              color: Colors.white,
              size: 34,
            ),
            onPressed: () {

              final stepIndex = ref.read(currentStepIndexProvider);
              final steps = ref.read(prayerStepsProvider);
              final currentRakat = ref.read(currentRakatProvider);
              final totalRakats = ref.read(totalRakatsProvider);
              final rakatType = ref.read(rakatTypeProvider);

              /// Move inside same rakat
              if (stepIndex < steps.length - 1) {
                ref.read(currentStepIndexProvider.notifier).state++;
              }

              /// Go to next rakat
              else {

                if (currentRakat < totalRakats) {

                  final nextRakat = currentRakat + 1;

                  ref.read(currentRakatProvider.notifier).state = nextRakat;

                  ref.read(prayerStepsProvider.notifier).state =
                      buildSteps(
                        isFirstRakat: nextRakat == 1,
                        isSecondRakat: nextRakat == 2,
                        isLastRakat: nextRakat == totalRakats,
                        totalRakats: totalRakats,
                        isWitr: rakatType == 'Witr',
                      );

                  ref.read(currentStepIndexProvider.notifier).state = 0;
                }

                /// All rakats finished
                else {
                  Navigator.pop(context);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
