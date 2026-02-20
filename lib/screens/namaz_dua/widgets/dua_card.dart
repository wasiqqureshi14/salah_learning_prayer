import 'package:flutter/material.dart';

class DuaCard extends StatelessWidget {
  final String arabic;
  final String translation;

  const DuaCard({
    super.key,
    required this.arabic,
    required this.translation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [

          /// Arabic Dua
          Text(
            arabic,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              height: 1.8,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 20),

          const Divider(),

          const SizedBox(height: 16),

          /// English Translation
          Text(
            translation,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
