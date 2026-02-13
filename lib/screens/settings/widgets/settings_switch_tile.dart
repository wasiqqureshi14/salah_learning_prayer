import 'package:flutter/material.dart';

class SettingsSwitchTile extends StatelessWidget {

  final String title;
  final bool value;
  final Function(bool) onChanged;

  const SettingsSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      value: value,
      activeColor: const Color(0xFF2FA4A9),
      onChanged: onChanged,
    );
  }
}
