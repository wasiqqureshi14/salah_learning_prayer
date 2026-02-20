import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/data/prayers_step_data.dart';
import 'package:salah_learning_prayer/providers/gender_provider.dart';
import 'package:salah_learning_prayer/providers/prayer_steps_provider.dart';

class PrayerControlBar extends ConsumerWidget {
  const PrayerControlBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          /// PREVIOUS BUTTONss
          Container(
              decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF016568),
                width: 2,
              ),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF016568),
                size: 28,
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
                    final gender = ref.watch(genderProvider)!;
            
            
                    final newSteps = buildSteps(
                        gender: gender,
              isFirstRakat: prevRakat == 1,
              isSecondRakat: prevRakat == 2,
              isLastRakat: prevRakat == totalRakats,
              totalRakats: totalRakats,
              isWitr: rakatType == 'Witr',
            );
            
            ref.read(prayerStepsProvider.notifier).state = newSteps;
            
            /// Now index is ALWAYS valid
            ref.read(currentStepIndexProvider.notifier).state =
                newSteps.length - 1;
            
                  }
                }
              },
            ),
          ),

          /// NEXT BUTTON
          Container(
             decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF016568),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () {
            
              final stepIndex = ref.read(currentStepIndexProvider);
              final steps = ref.read(prayerStepsProvider);
              final currentRakat = ref.read(currentRakatProvider);
              final totalRakats = ref.read(totalRakatsProvider);
              final rakatType = ref.read(rakatTypeProvider);
            
              final step = steps[stepIndex];
              final repeat = ref.read(repeatCountProvider);
            
              /// 🔥 HANDLE REPEAT FIRST
              if (repeat < step.repeat) {
            
                ref.read(repeatCountProvider.notifier).state++;
            
                return; // stay on same step
              }
            
              /// Reset repeat for next step
              ref.read(repeatCountProvider.notifier).state = 1;
            
              /// Move inside same rakat
              if (stepIndex < steps.length - 1) {
            
                ref.read(currentStepIndexProvider.notifier).state++;
            
              }
            
              /// Go to next rakat
              else {
            
                if (currentRakat < totalRakats) {
            
                  final nextRakat = currentRakat + 1;
            
                  ref.read(currentRakatProvider.notifier).state = nextRakat;
                  final gender = ref.watch(genderProvider)!;
            
            
                  ref.read(prayerStepsProvider.notifier).state =
            buildSteps(
                gender: gender,
              isFirstRakat: nextRakat == 1,
              isSecondRakat: nextRakat == 2,
              isLastRakat: nextRakat == totalRakats,
              totalRakats: totalRakats,
              isWitr: rakatType == 'Witr',
            );
            
                  ref.read(currentStepIndexProvider.notifier).state = 0;
            
                  /// 🔥 VERY IMPORTANT
                  ref.read(repeatCountProvider.notifier).state = 1;
                }
            
                /// All rakats finished
                else {
                  Navigator.pop(context);
                }
              }
            }
            
            ),
          ),
        ],
      ),
    );
  }
}
