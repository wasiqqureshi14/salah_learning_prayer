import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/data/prayers_step_data.dart';
import 'package:salah_learning_prayer/providers/gender_provider.dart';
import 'package:salah_learning_prayer/providers/prayer_steps_provider.dart';
import 'package:salah_learning_prayer/screens/steps/prayer_steps_screen.dart';

class RakatButton extends ConsumerWidget {
  final String text;

  const RakatButton({super.key, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF016568),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
          ),
          onPressed: () {
  final parts = text.split(' ');
  final totalRakats = int.parse(parts[0]);
  final type = parts.last;

  ref.read(selectedRakatTextProvider.notifier).state = text;
 ref.read(rakatTypeProvider.notifier).state = type;
  ref.read(totalRakatsProvider.notifier).state = totalRakats;
  ref.read(currentRakatProvider.notifier).state = 1;
  final gender = ref.watch(genderProvider)!;


  ref.read(prayerStepsProvider.notifier).state =
      buildSteps(
          gender: gender,
        isFirstRakat: true,
        isSecondRakat: false,
        isLastRakat: totalRakats == 1,
        totalRakats: totalRakats,
        isWitr: type == 'Witr',
      );

  ref.read(currentStepIndexProvider.notifier).state = 0;

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const PrayerStepsScreen(),
    ),
  );
},

          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
