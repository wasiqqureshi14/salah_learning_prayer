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
            size ?? MediaQuery.of(context).size.width * 0.65;

        return Center(
          child: StreamBuilder<CompassEvent>(
            stream: FlutterCompass.events,
            builder: (context, snapshot) {

              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }

              final heading =
                  snapshot.data?.heading ?? 0;

              final qibla =
                  calculateQiblaDirection(lat, lng);

              /// Rotate ONLY the needle
              final rotation =
                  (qibla - heading) * (pi / 180);

              return Container(
                height: compassSize,
                width: compassSize,

                /// ⭐ Creates perfect circle + shadow
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF016568),
                ),

                clipBehavior: Clip.hardEdge,

                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    
                     _buildDirectionLetters(compassSize),

                    /// ✅ ROTATING NEEDLE
                    Transform.rotate(
                      angle: rotation,
                      child: Image.asset(
                        'assets/images/mosque/needle.png',
                        height: compassSize * 0.75,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },

      /// ✅ LOADING
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),

      /// ✅ ERROR
      error: (e, _) => Center(
        child: Text(
          "Location error: $e",
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
  Widget _buildDirectionLetters(double size) {

    final textStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: size * 0.06,
    );

    return Stack(
      children: [

        /// North
        Positioned(
          top: size * 0.04,
          left: 0,
          right: 0,
          child: Center(child: Text("N", style: textStyle)),
        ),

        /// South
        Positioned(
          bottom: size * 0.04,
          left: 0,
          right: 0,
          child: Center(child: Text("S", style: textStyle)),
        ),

        /// East
        Positioned(
          right: size * 0.04,
          top: 0,
          bottom: 0,
          child: Center(child: Text("E", style: textStyle)),
        ),

        /// West
        Positioned(
          left: size * 0.04,
          top: 0,
          bottom: 0,
          child: Center(child: Text("W", style: textStyle)),
        ),
      ],
    );
  }

}
