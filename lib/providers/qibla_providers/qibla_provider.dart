import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/core/utils/qibla_helper.dart';
import 'package:salah_learning_prayer/providers/location_provider.dart';

final qiblaProvider = Provider<double>((ref) {

  final locationAsync = ref.watch(locationProvider);

  return locationAsync.when(
    data: (pos) =>
        calculateQiblaDirection(
          pos.latitude,
          pos.longitude,
        ),

    loading: () => 0,

    error: (_, __) => 0,
  );
});
