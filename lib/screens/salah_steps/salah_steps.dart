import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/providers/demo_salah_steps_provider.dart';

class DemoStepsScreen extends ConsumerWidget {
  const DemoStepsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    /// auto reset on gender change
    ref.watch(demoResetIndexProvider);

    final steps = ref.watch(demoPrayerStepsProvider);
    final index = ref.watch(demoStepIndexProvider);

    /// 🛑 Safety protection
    if (steps.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (index >= steps.length) {
      Future.microtask(() {
        ref.read(demoStepIndexProvider.notifier).state = 0;
      });
    }

    final step = steps[index];

    return Scaffold(
      backgroundColor: const Color(0xfff5f7fa),

      appBar: AppBar(
        title: const Text("Salah Demo", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF016568),
      ),

      body: Column(
        children: [

          /// ✅ Step Counter
          SizedBox(height: 20),

          Text(
            "Step ${index + 1} of ${steps.length}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),

          /// ✅ IMAGE AREA
          Expanded(
            child: GestureDetector(

              /// 👉 Swipe Right
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! > 0) {
                  if (index > 0) {
                    ref.read(demoStepIndexProvider.notifier).state--;
                  }
                }

                /// 👉 Swipe Left
                else if (details.primaryVelocity! < 0) {
                  if (index < steps.length - 1) {
                    ref.read(demoStepIndexProvider.notifier).state++;
                  }
                }
              },

              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),

                child: Image.asset(
                  step.image,
                  key: ValueKey(step.image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          /// ✅ Navigation Buttons
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                IconButton(
                  iconSize: 38,
                  onPressed: index == 0
                      ? null
                      : () {
                          ref
                              .read(demoStepIndexProvider.notifier)
                              .state--;
                        },
                  icon: const Icon(Icons.arrow_back_ios),
                ),

                IconButton(
                  iconSize: 38,
                  onPressed: index == steps.length - 1
                      ? null
                      : () {
                          ref
                              .read(demoStepIndexProvider.notifier)
                              .state++;
                        },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
