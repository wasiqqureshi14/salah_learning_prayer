import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/providers/prayer_provider.dart';
import 'package:salah_learning_prayer/screens/steps/widgets/prayer_control_bar.dart';
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

    final prayer = ref.watch(selectedPrayerProvider);
    final selectedRakatText = ref.watch(selectedRakatTextProvider);

    final repeat = ref.watch(repeatCountProvider);

    final globalStepNumber =
        ((currentRakat - 1) * steps.length) + (index + 1);

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          prayer.name,
          style: const TextStyle(
            color: Color(0xFF016568),
            fontSize: 26,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [

                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                       width: MediaQuery.of(context).size.width * 0.65,
                      decoration: BoxDecoration(
                        color: const Color(0xFF016568),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          selectedRakatText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              "Step $globalStepNumber: ",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.2,
                                color: Colors.black,
                              ),
                            ),

                            Expanded(
                              child: Text(
                                step.title,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),


                    /// IMAGE (FLEXIBLE PREVENTS OVERFLOW)
                    Flexible(
                      flex: 3,
                      child: Image.asset(
                        step.image,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),

                 

                    /// ARABIC LABEL
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Arabic: ($repeat/${step.repeat})",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

               

                    /// ARABIC TEXT
                    Flexible(
                      flex: 1,
                      child: Center(
                        child: Text(
                          step.arabic,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                

                    /// TRANSLATION LABEL
                    Align(
                      alignment: Alignment.centerLeft,
                       child:  Text(
                        "English Translation:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

               

                    /// TRANSLATION TEXT
                    Flexible(
                      flex: 2,
                      child: Center(
                        child: Text(
                          step.translation,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                  const SizedBox(height: 4),

                  ],
                ),
              ),
            ),

            /// CONTROL BAR
            const PrayerControlBar(),
          ],
        ),
      ),
    );
  }
}
