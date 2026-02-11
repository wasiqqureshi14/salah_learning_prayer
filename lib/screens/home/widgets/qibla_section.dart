import 'package:flutter/material.dart';
import 'package:salah_learning_prayer/widgets/qibla_card.dart';

class QiblaSection extends StatelessWidget {
  const QiblaSection({super.key});

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {

        final size = constraints.maxHeight * 0.75;

        return Center(
          child: QiblaCard(size: size),
        );
      },
    );
  }
}

