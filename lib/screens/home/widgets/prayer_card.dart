import 'package:flutter/material.dart';

class PrayerCard extends StatelessWidget {
  final String name;
  final String time;
  final IconData icon;
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
    final double cardWidth = MediaQuery.of(context).size.width * 0.16;

    return SizedBox(
      width: cardWidth,
      height: 110,
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
           color: isActive
    ? Colors.white.withOpacity(0.35)
    : Colors.white.withOpacity(0.15),

border: isActive
    ? Border.all(
        color: Colors.white,
        width: 2,
      )
    : null,

boxShadow: isActive
    ? [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ]
    : [],
            borderRadius: BorderRadius.circular(40),
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
              const SizedBox(height: 8),
              Icon(icon, color: Colors.white, size: 20),
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
      ),
    );
  }
}
