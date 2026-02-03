import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salah_learning_prayer/providers/prayer_provider.dart';
import 'package:salah_learning_prayer/screens/prayer_detail/widgets/mosque_shape.dart';
import 'widgets/rakat_button.dart';

class PrayerDetailScreen extends ConsumerWidget {
  const PrayerDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prayer = ref.watch(selectedPrayerProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ClipPath(
              clipper: HeaderCurveClipper(),
              child: Container(
                height: 360,
                width: double.infinity,
                decoration: BoxDecoration(
                color: const Color(0xFF016568),),
                
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Mosque SVG (watermark)
                    Positioned(
                      bottom: -60,
                      top: 0,
                      child: Opacity(
                        opacity: 0.2,
                        child: SvgPicture.asset(
                          'assets/images/mosque.svg',
                          fit: BoxFit.contain,
                         
                        ),
                      ),
                    ),
              
                    // Title
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          prayer.name,
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Prayers',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // SPACE
          const SliverToBoxAdapter(
            child: SizedBox(height: 24),
          ),

          // BUTTONS
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ...prayer.rakats.map(
                    (rakat) => RakatButton(text: rakat),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
