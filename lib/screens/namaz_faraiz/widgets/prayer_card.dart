
import 'package:flutter/material.dart';
class PrayerModel {
  final String title;
  final String rakaat;
  final IconData icon;

  PrayerModel(this.title, this.rakaat, this.icon);
}

final prayers = [
  PrayerModel("Fajar", "2", Icons.wb_twilight),
  PrayerModel("Duhar", "4", Icons.wb_sunny_outlined),
  PrayerModel("Asr", "4", Icons.cloud_outlined),
  PrayerModel("Magrib", "3", Icons.wb_twilight_outlined),
  PrayerModel("Isha", "4", Icons.nightlight_round),
  PrayerModel("Jummah", "2", Icons.wb_sunny),
];

class PrayerCard extends StatelessWidget {
  final String title;
  final String rakaat;
  final IconData icon;

  const PrayerCard({
    super.key,
    required this.title,
    required this.rakaat,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const  Color(0xFF016568),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 36),
          const SizedBox(height: 10),
          Text(
            "$title\n($rakaat)",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
