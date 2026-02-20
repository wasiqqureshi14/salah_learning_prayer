import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:salah_learning_prayer/core/services/prayer_services.dart';
import 'package:salah_learning_prayer/providers/prayer_time_provider.dart';

class PrayerEndCard extends ConsumerWidget {
  const PrayerEndCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return LayoutBuilder(
      builder: (context, constraints) {

        final height = constraints.maxHeight;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: ref.watch(prayerTimesProvider).when(
            data: (times) {

              final currentPrayer = times.currentPrayer();
              final endTime =PrayerService.getPrayerEndTime(
                     currentPrayer, times);

              final formattedEndTime =
                  DateFormat('hh:mm a').format(endTime);

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    /// TITLE
                    FittedBox( 
                      child: Text(
                        "${currentPrayer.name.toUpperCase()} Ends At",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: height * 0.15, // responsive
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.04),

                    /// TIME
                    FittedBox(
                      child: Text(
                        formattedEndTime,
                        style: TextStyle(
                          fontSize: height * 0.20,
                          fontWeight: FontWeight.w900,
                          color: const Color(0xFF016568),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },

           error: (_, __) => _buildEndCard("", height),
            loading: () => _buildEndCard("", height),
          ),
        );
      },
    );
  }
}
Widget _buildEndCard(String time, double height) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "PRAYER Ends At",
          style: TextStyle(
            color: Colors.grey,
            fontSize: height * 0.15,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: height * 0.04),
        Text(
          time,
          style: TextStyle(
            fontSize: height * 0.20,
            fontWeight: FontWeight.w900,
            color: const Color(0xFF016568),
          ),
        ),
      ],
    ),
  );
}
