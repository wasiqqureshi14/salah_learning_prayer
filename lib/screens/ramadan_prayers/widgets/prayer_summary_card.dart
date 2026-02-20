import 'package:flutter/material.dart';
import 'package:salah_learning_prayer/screens/ramadan_prayers/widgets/prayer_count.dart';

class PrayerSummaryCard extends StatelessWidget {
  const PrayerSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
         border: Border.all(
          color: const Color(0xFF016568).withOpacity(.4),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            "Ramadan Isha Prayer",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Color(0xFF016568)
            ),
          ),

          SizedBox(height: 18),

          PrayerCount(label: "Sunnah", count: "4"),
          PrayerCount(label: "Farz", count: "4"),
          PrayerCount(label: "Sunnah", count: "2"),
          PrayerCount(label: "Nafl", count: "2"),
        ],
      ),
    );
  }
}
