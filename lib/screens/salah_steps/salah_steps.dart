import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/providers/common_salah_steps_provider.dart';
import 'package:salah_learning_prayer/screens/settings/setting.dart';

class DemoStepsScreen extends ConsumerWidget {
  const DemoStepsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    /// auto reset on gender change
    ref.watch(demoResetIndexProvider);

    final steps = ref.watch(demoPrayerStepsProvider);
    final index = ref.watch(demoStepIndexProvider);

    /// Safety
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
      backgroundColor:  Colors.white,

      /// ================= APP BAR =================
      appBar: AppBar(
        toolbarHeight: 72,
        elevation: 0,
        backgroundColor: const Color(0xFF016568),

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),

        title: const Text(
          "Common Salah Steps",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.settings_outlined,
                  color: Colors.white, size: 32),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Settingscreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      /// ================= BODY =================
      body: Column(
        children: [

          const SizedBox(height: 20),

          /// Step Counter
          Text(
            "Step ${index + 1} of ${steps.length}",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 12),

          /// Progress Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: LinearProgressIndicator(
              value: (index + 1) / steps.length,
              backgroundColor: Colors.grey.shade300,
              color: const Color(0xFF016568),
              minHeight: 6,
            ),
          ),

          const SizedBox(height: 18),

          /// Guided Title
          Text(
            step.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF016568),
            ),
          ),

          const SizedBox(height: 6),

          /// Guided Instruction
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              step.instruction,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
                height: 1.4,
              ),
            ),
          ),

          const SizedBox(height: 18),

          /// ================= IMAGE AREA =================
          Expanded(
            child: GestureDetector(

              /// Swipe Right
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! > 0 && index > 0) {
                  ref.read(demoStepIndexProvider.notifier).state--;
                }

                /// Swipe Left
                else if (details.primaryVelocity! < 0 &&
                    index < steps.length - 1) {
                  ref.read(demoStepIndexProvider.notifier).state++;
                }
              },

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                 
                  padding: const EdgeInsets.all(16),
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
            ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                /// Previous
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF016568),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios,
                        color: Colors.white),
                    onPressed: index == 0
                        ? null
                        : () {
                            ref
                                .read(demoStepIndexProvider.notifier)
                                .state--;
                          },
                  ),
                ),
                const SizedBox(width: 30),

                /// Next
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF016568),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white),
                    onPressed: index == steps.length - 1
                        ? null
                        : () {
                            ref
                                .read(demoStepIndexProvider.notifier)
                                .state++;
                          },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}