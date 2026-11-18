import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/providers/wudu_provider/wudu_provider.dart';

class WuduControlBar extends ConsumerWidget {
  const WuduControlBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          /// PREVIOUS BUTTON
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
                goToPreviousWuduStep(ref);
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
                final index =
                    ref.read(wuduCurrentStepIndexProvider);
                final steps =
                    ref.read(wuduStepsProvider);

                if (index == steps.length - 1) {
                   ref.read(wuduCurrentStepIndexProvider.notifier).state = 0;
                  Navigator.pop(context);
                } else {
                  goToNextWuduStep(ref);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
