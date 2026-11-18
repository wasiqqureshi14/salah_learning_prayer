import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/providers/wudu_provider/wudu_farz_provider.dart';
import 'package:salah_learning_prayer/screens/settings/setting.dart';
import 'package:salah_learning_prayer/screens/wudu/wudu_farz/widgets/bottom_buttons.dart';

class WuduFarzStepsScreen extends ConsumerWidget {
  const WuduFarzStepsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final steps = ref.watch(wuduFarzStepsProvider);
    final currentIndex =
        ref.watch(wuduFarzCurrentStepIndexProvider);

    final step =
        ref.watch(currentWuduFarzStepProvider);

    return PopScope(
      onPopInvoked: (didPop) {
        resetWuduFarzSteps(ref);
      },
      child: Scaffold(
        backgroundColor: Colors.white,

        /// APP BAR
         appBar: AppBar(
            toolbarHeight: 72,
          elevation: 0,
          centerTitle: false,
          backgroundColor: Color(0xFF016568),
      
           leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      
          title: Text(
            "Wudu Farz",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
      
          actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white, size: 32,),
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

        body: Column(
          children: [

            /// CONTENT
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [

                    /// HEADER
                    Row(
                      children: [
                        Text(
                          "Step ${step.order}:",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black
                          ),
                        ),
                        Expanded(
                          child: Text(
                            step.title,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// IMAGE
                    Expanded(
                      flex: 4,
                      child: Image.asset(
                        step.image,
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// ARABIC
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Arabic:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                step.arabic,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// ENGLISH
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "English Translation:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                step.translation,
                                textAlign: TextAlign.center,
                                 style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black
                                ),
                                
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const WuduControlBar()
          ],
        ),
      ),
    );
  }
}
