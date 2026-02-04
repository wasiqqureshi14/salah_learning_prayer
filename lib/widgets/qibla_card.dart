import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/providers/location_provider.dart';
import 'package:salah_learning_prayer/core/utils/qibla_helper.dart';

class QiblaCard extends ConsumerWidget {
  final double? size;

  const QiblaCard({
    super.key,
    this.size,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final locationAsync = ref.watch(locationProvider);

    return locationAsync.when(

      /// ✅ LOCATION SUCCESS
      data: (position) {

        final lat = position.latitude;
        final lng = position.longitude;

        final compassSize =
            size ?? MediaQuery.of(context).size.width * 0.55;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF016568),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [

              /// ⭐ COMPASS STREAM
              StreamBuilder<CompassEvent>(
                stream: FlutterCompass.events,
                builder: (context, snapshot) {

                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator(
                      color: Colors.white,
                    );
                  }

                  final heading =
                      snapshot.data?.heading ?? 0;

                  final qibla =
                      calculateQiblaDirection(lat, lng);

                  final rotation =
                      (qibla - heading) * (pi / 180);

                  /// ⭐ PREMIUM STYLE (Static compass + rotating needle)
                  return SizedBox(
                    height: compassSize,
                    width: compassSize,
                    child: ClipOval(
                      child: Container(
                        color: Colors.white,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                        
                            /// Compass background
                            Image.asset(
                              'assets/images/compass.png',
                            ),
                        
                            /// Rotating needle
                            Transform.rotate(
                              angle: rotation,
                              child: Image.asset(
                                'assets/images/needle.png',
                                height: compassSize * 0.7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },

      /// ⭐ LOADING
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),

      /// ⭐ ERROR
      error: (e, _) => Text(
        "Location error: $e",
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
