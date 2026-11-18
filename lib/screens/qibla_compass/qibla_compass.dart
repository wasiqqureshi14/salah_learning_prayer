
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/providers/qibla_providers/needle_rotation_provider.dart';
import 'package:salah_learning_prayer/widgets/qibla_card.dart';
import 'package:salah_learning_prayer/providers/location_provider.dart';

class QiblaDirectionScreen extends ConsumerWidget {
  const QiblaDirectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth  = MediaQuery.of(context).size.width;

    final locationAsync = ref.watch(locationProvider);

    return Scaffold(
        backgroundColor: Colors.white,
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
          "Qibla Direction",
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
            // open settings
          },
        ),
      ),
    ],
  ),
      

        body: SafeArea(
          child: locationAsync.when(

            data: (_) {

              final rotation =
                  ref.watch(needleRotationProvider);

              return Column(
                children: [

                SizedBox(height: screenHeight * 0.07),


                  const Text(
                    "Point the top of the phone towards the Qibla",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700
                    ),
                  ),

                 SizedBox(height: screenHeight * 0.07),


                  LayoutBuilder(
                    builder: (context, constraints) {

                      double size = screenWidth * 0.75;

                      size = size.clamp(220.0, 420.0);


                      return QiblaCard(size: size,kaabaSize: 35,);
                    },
                  ),

                 SizedBox(height: screenHeight * 0.07),

                  Text(
                    "${rotation.toStringAsFixed(0)}°",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF016568),
                    ),
                  ),

                 SizedBox(height: screenHeight * 0.02),


                  const Text(
                    "Facing Kaaba in Makkah",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),


                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08,
                    ),
                    child: SizedBox(
                      height: (screenHeight * 0.065).clamp(48.0, 60.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          showCalibrationDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF016568),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        icon: const Icon(
                          Icons.explore,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "CALIBRATE",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              );
            },

            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),

            error: (_, __) => const Center(
              child: Text(
                "Location error",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ),
    );
  }
}

void showCalibrationDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 30,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [

              /// Infinity Icon
              Icon(
                Icons.all_inclusive,
                size: 70,
                color: Color(0xFF016568),
              ),

              SizedBox(height: 20),

              /// Text
              Text(
                "Move your phone in a figure 8 motion for better compass accuracy.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
