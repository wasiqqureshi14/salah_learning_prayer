import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/providers/wudu_provider/wudu_provider.dart';
import 'package:salah_learning_prayer/screens/settings/setting.dart';
import 'package:salah_learning_prayer/screens/wudu/wudu_steps/widgets/wudu_control_bar.dart';

class WuduStepsScreen extends ConsumerWidget {
  const WuduStepsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    /// Listen to providers
    final steps = ref.watch(wuduStepsProvider);
    final currentIndex =
        ref.watch(wuduCurrentStepIndexProvider);

    final step = steps[currentIndex];

    return PopScope(
      onPopInvoked: (didPop) {
    ref.read(wuduCurrentStepIndexProvider.notifier).state = 0;
  },
      child: Scaffold(
        backgroundColor: Colors.white,
         appBar: AppBar(
            toolbarHeight: 72,
          elevation: 0,
          centerTitle: false,
          backgroundColor: Color(0xFF016568),
      
           leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () {
                ref.read(wuduCurrentStepIndexProvider.notifier).state = 0;
                Navigator.pop(context);
              },
            ),
      
          title: Text(
            "Wudu Steps",
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
      
            /// ===== STEP PROGRESS =====
            LinearProgressIndicator(
              value: (currentIndex + 1) / steps.length,
              color: const Color(0xFF016568),
              backgroundColor: Colors.grey.shade200,
              minHeight: 5,
            ),
      
           Expanded(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
      
          /// STEP HEADER ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Step ${step.order}:",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Text(
                  step.title,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
      
          const SizedBox(height: 20),
      
          /// IMAGE TAKES FLEXIBLE SPACE
          Expanded(
            flex: 4,
              child: Image.asset(
                step.image,
                fit: BoxFit.contain,
              ),
            
          ),
      
          const SizedBox(height: 20),
      
          Align( 
            alignment: Alignment.centerLeft, 
            child: Text( 
              "Arabic",
               style: TextStyle( 
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black), 
                ),
                 ),
                  const SizedBox(height: 2),
      
          /// ARABIC
          Flexible(
              flex: 1,
              child: Center(
                child: Text(
                  step.arabic,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.6,
                    color: Colors.black,
                  ),
                ),
              ),
            
          ),
      
          Align( 
            alignment: Alignment.centerLeft, 
            child: Text( 
              "English Translation", 
               style: TextStyle( 
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black),
                 ),
                  ),
      
          /// TRANSLATION
          Flexible(
              flex: 2,
              child: Center(
                child: Text(
                  step.translation,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ),
            
          ),
        ],
      ),
        ),
      ),
      
            /// ✅ SEPARATE CONTROL BAR
            const WuduControlBar(),
          ],
        ),
      ),
    );
  }
}
