import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salah_learning_prayer/providers/qibla_providers/needle_rotation_provider.dart';
import 'package:salah_learning_prayer/providers/qibla_providers/qibla_provider.dart';


class QiblaCard extends ConsumerWidget {
  final double? size;
  final double kaabaSize;
final Color? kaabaColor;


  const QiblaCard({
    super.key,
    this.size,
    this.kaabaSize = 28, // ⭐ default
  this.kaabaColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final compassSize =
        size ?? MediaQuery.of(context).size.width * 0.65;

    final rotation =
        ref.watch(needleRotationProvider);

    final qiblaAngle =
        ref.watch(qiblaProvider);

    /// convert to radians
    final kaabaRadians = qiblaAngle * pi / 180;

    final radius = compassSize / 2;
      final double iconSize = kaabaSize;
      final center = compassSize / 2;

      /// distance ABOVE the outline
      final double offset = iconSize * 0.35; 
      // scales automatically with icon size

      final kaabaX =
          center + (radius + offset) * cos(kaabaRadians) - iconSize / 2;

      final kaabaY =
          center + (radius + offset) * sin(kaabaRadians) - iconSize / 2;


    return Center(
      child: Container(
        height: compassSize,
        width: compassSize,
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF016568),
           border: Border.all(
      color: Colors.white,
      width: compassSize * 0.04, // ⭐ responsive thickness
    ),
        ),
     
        child: Stack(
           clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [

             Container(
      height: compassSize * 0.85,
      width: compassSize * 0.85,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: compassSize * 0.02,
        ),
      ),
    ),

            _buildDirectionLetters(compassSize),

            /// ⭐ KAABA (small, outlined position)
            Positioned(
              left: kaabaX,
              top: kaabaY,
              child:SvgPicture.asset(
                'assets/images/mosque/kaaba-svgrepo-com.svg',
                height: kaabaSize,
                colorFilter: kaabaColor != null
                    ? ColorFilter.mode(
                        kaabaColor!,
                        BlendMode.srcIn,
                      )
                    : null,
              ),

            ),

            /// ROTATING NEEDLE
            Transform.rotate(
              angle: rotation * (pi / 180),
              child: Image.asset(
                'assets/images/mosque/needle.png',
                height: compassSize * 0.75,
              ),
            ),
          ],
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

        Positioned(
          top: size * 0.08,
          left: 0,
          right: 0,
          child: Center(child: Text("N", style: textStyle)),
        ),

        Positioned(
          bottom: size * 0.08,
          left: 0,
          right: 0,
          child: Center(child: Text("S", style: textStyle)),
        ),

        Positioned(
          right: size * 0.08,
          top: 0,
          bottom: 0,
          child: Center(child: Text("E", style: textStyle)),
        ),

        Positioned(
          left: size * 0.08,
          top:0,
          bottom: 0,
          child: Center(child: Text("W", style: textStyle)),
        ),
      ],
    );
  }
}
