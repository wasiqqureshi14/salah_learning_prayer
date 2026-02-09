
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/widgets/qibla_card.dart';
import 'package:salah_learning_prayer/providers/location_provider.dart';
import 'package:salah_learning_prayer/core/utils/qibla_helper.dart';

class QiblaDirectionScreen extends ConsumerWidget {
  const QiblaDirectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final locationAsync = ref.watch(locationProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: locationAsync.when(

            /// ✅ LOCATION SUCCESS
            data: (position) {

              final lat = position.latitude;
              final lng = position.longitude;

              return StreamBuilder<CompassEvent>(
                stream: FlutterCompass.events,
                builder: (context, snapshot) {

                  double directionText = 0;

                  if (snapshot.hasData) {
                    final heading =
                        snapshot.data?.heading ?? 0;

                    final qibla =
                        calculateQiblaDirection(lat, lng);

                    directionText =
                        (qibla - heading + 360) % 360;
                  }

                  return Column(
                    children: [

                      const SizedBox(height: 20),

                      /// TITLE
                      const Text(
                        "Qibla Direction",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF016568),
                        ),
                      ),

                      const SizedBox(height: 6),

                      /// SUBTITLE
                      const Text(
                        "Point the top of the phone towards the Qibla",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),

                      const Spacer(),

                      /// COMPASS (YOUR OLD WIDGET)
                      LayoutBuilder(
                        builder: (context, constraints) {

                          double size =
                              constraints.maxWidth * 0.75;

                          if (size > 380) {
                            size = 380;
                          }

                          return QiblaCard(size: size);
                        },
                      ),

                      const Spacer(),

                      /// DIRECTION TEXT
                      Text(
                        "${directionText.toStringAsFixed(0)}°",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF016568),
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// LOCATION TEXT
                      const Text(
                        "Facing Kaaba in Makkah",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),

                      const SizedBox(height: 25),

                      /// CALIBRATE BUTTON
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              FlutterCompass.events;
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
              );
            },

            /// ✅ LOADING
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),

            /// ✅ ERROR
            error: (e, _) => Center(
              child: Text(
                "Location error",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
