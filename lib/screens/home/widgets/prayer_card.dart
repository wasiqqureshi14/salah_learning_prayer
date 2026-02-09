import 'package:flutter/material.dart';

class PrayerCard extends StatelessWidget {
  final String name;
  final String time;
  final Widget icon;
  final bool isActive;
  final VoidCallback? onTap;

  const PrayerCard({
    super.key,
    required this.name,
    required this.time,
    required this.icon,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isActive
              ? Colors.white.withOpacity(0.35)
              : Colors.white.withOpacity(0.18),
          borderRadius: BorderRadius.circular(40),
          border: isActive
              ? Border.all(color: Colors.white, width: 2)
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 6),

            SizedBox(
              height: 40,
              child: icon,
            ),

            const SizedBox(height: 6),

            Text(
              time,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
