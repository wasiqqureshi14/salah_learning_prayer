import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/data/prayers_step_data.dart';
import 'package:salah_learning_prayer/providers/prayer_provider.dart';
import '../../providers/prayer_steps_provider.dart';

class PrayerStepsScreen extends ConsumerWidget {
  const PrayerStepsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final steps = ref.watch(prayerStepsProvider);
    final index = ref.watch(currentStepIndexProvider);
    final step = steps[index];
    final currentRakat = ref.watch(currentRakatProvider);
    final totalRakats = ref.watch(totalRakatsProvider);
    final nextRakat = currentRakat + 1;
    final rakatType = ref.watch(rakatTypeProvider);
    final prayer = ref.watch(selectedPrayerProvider);
    final selectedRakatText = ref.watch(selectedRakatTextProvider);
    final globalStepNumber =
    ((currentRakat - 1) * steps.length) + (index + 1);
    final totalSteps = totalRakats * steps.length;



    return Scaffold(
           backgroundColor: Colors.white,
             appBar: AppBar(
                elevation: 0,
                    backgroundColor: Colors.white,
                      title: Text(
                      prayer.name,
                      style: const TextStyle( 
                          color: Color(0xFF016568),
                          fontSize: 36, fontWeight: FontWeight.w900),
                            ),
                          ),
                        body: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Container(
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFF016568),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                            Text(
                    selectedRakatText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                    "Step $globalStepNumber: ",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.5,
                                      color: Colors.black,
                                    ),
                                        ),
                              ),

                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 15),
                            child: Text(
                                    "${step.title}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                                const SizedBox(height: 4),
                            ],
                          ),
                        ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Image.asset(
      step.image,
      height: 220,
      fit: BoxFit.contain,
    ),
    const SizedBox(height: 20),

    Text ("Arabic",
    style: TextStyle(fontSize: 16,  
     fontWeight: FontWeight.bold,
    color: Colors.black),
    ),
    const SizedBox(height: 12),

    
    SizedBox(
      width: double.infinity,
      child: Text(
          step.arabic,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
    ),
    
    const SizedBox(height: 12),

     Text ("English Translation",
     style: TextStyle(fontSize: 16, 
      fontWeight: FontWeight.bold,
    color: Colors.black),
    ),
    const SizedBox(height: 12),

    SizedBox(
      width: double.infinity,
      child: Text(
        step.translation,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
    ),
  ],
),
          
            ElevatedButton(
             onPressed: () {
  final stepIndex = ref.read(currentStepIndexProvider);
  final steps = ref.read(prayerStepsProvider);
  final currentRakat = ref.read(currentRakatProvider);
  final totalRakats = ref.read(totalRakatsProvider);

  // Still steps left in same rakat
  if (stepIndex < steps.length - 1) {
    ref.read(currentStepIndexProvider.notifier).state++;
  } 
  // Steps finished → go to next rakat
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
    // All rakats finished
    else {
      Navigator.pop(context);
    }
  }
}, child: null,

            ),
          ],
        ),
      ),
    );
  }
}
