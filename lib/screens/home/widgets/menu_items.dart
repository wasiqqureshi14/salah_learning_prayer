
import 'package:flutter/material.dart';


class MenuItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback? onTap;

  const MenuItem({
    required this.title,
    required this.icon,
    this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF016568),
            borderRadius: BorderRadius.circular(16),
      child: InkWell(
         borderRadius: BorderRadius.circular(16),
      onTap: onTap,
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
        ),
      ),
    );
  }
}
