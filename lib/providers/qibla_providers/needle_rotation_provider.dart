
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/providers/qibla_providers/compass_provider.dart';
import 'package:salah_learning_prayer/providers/qibla_providers/qibla_provider.dart';

final needleRotationProvider = Provider<double>((ref) {

  final qibla = ref.watch(qiblaProvider);

  final compassAsync =
      ref.watch(compassProvider);

  final heading =
      compassAsync.value ?? 0;

  /// ⭐ ALWAYS normalize angles
  return (qibla - heading + 360) % 360;
});

