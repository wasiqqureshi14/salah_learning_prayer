import 'package:flutter/material.dart';

class TaraweehCard extends StatelessWidget {
  const TaraweehCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF016568).withOpacity(.4),
        ),
      ),
      child: Column(
        children: const [
          Text(
            "Taraweeh Prayer",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF016568),
            ),
          ),

          SizedBox(height: 8),

          Text(
            "Perform same like Sunnah Namaz",
            style: TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),

          SizedBox(height: 14),

          Text(
            "20 Rakats",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF016568),
            ),
          ),

          SizedBox(height: 4),

          Text(
            "2 Rakats × 10",
            style: TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
