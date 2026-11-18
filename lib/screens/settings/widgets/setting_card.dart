import 'package:flutter/material.dart';

class SettingsSectionCard extends StatelessWidget {

  final Widget child;

  const SettingsSectionCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFF016568),
          width: 1.2,
        ),
      ),
      child: child,
    );
  }
}
