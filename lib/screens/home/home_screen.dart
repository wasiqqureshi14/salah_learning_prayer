import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/screens/home/widgets/prayer_end_time.dart';
import 'widgets/home_header.dart';
import 'widgets/menu_grid.dart';
import 'widgets/qibla_section.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF016568),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final height = constraints.maxHeight;

             return Column(
  children: [

    Expanded(
      flex: 38,
      child: const HomeHeader(),
    ),

    Expanded(
      flex: 11, // increased from 10
      child: const PrayerEndCard(),
    ),

    Expanded(
      flex: 32,
      child: const MenuGrid(),
    ),

    Expanded(
      flex: 12,
      child: const QiblaSection(),
    ),

            ],
          );
            },
          ),
          
        ),
      ),
    );
  }
}
