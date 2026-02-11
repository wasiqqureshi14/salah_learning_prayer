import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/models/gender.dart';
import 'package:salah_learning_prayer/providers/gender_provider.dart';
import 'package:salah_learning_prayer/screens/home/home_screen.dart';

class GenderSelectionScreen extends ConsumerWidget {
  const GenderSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   return AnnotatedRegion<SystemUiOverlayStyle>(
     value: const SystemUiOverlayStyle(
    statusBarColor: Colors.white, // ✅ White status bar
    statusBarIconBrightness: Brightness.dark, // ✅ Dark icons (battery, time)
    statusBarBrightness: Brightness.light, // For iOS
  ),
     child: Scaffold(
       backgroundColor: Colors.white,
       body: Center(
      child: Container(
        width: 320,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
     
            const Text(
              "Choose Your Gender",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Color(0xFF016568),
              ),
            ),
     
            const SizedBox(height: 30),
     
            /// Male Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF016568),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  ref.read(genderProvider.notifier).state = Gender.male;
     
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomeScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Male",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
     
            const SizedBox(height: 16),
     
            /// Female Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF016568)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  ref.read(genderProvider.notifier).state = Gender.female;
     
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomeScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Female",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF016568),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
       ),
     ),
   );
  }
}
