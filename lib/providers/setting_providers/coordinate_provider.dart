import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adhan/adhan.dart';
import 'package:salah_learning_prayer/providers/location_provider/location_provider.dart';
import 'package:salah_learning_prayer/providers/setting_providers/setting_provider.dart';

final coordinatesProvider =
    FutureProvider<Coordinates>((ref) async {

  final settings =
      await ref.watch(appSettingsProvider.future);

  /// AUTO LOCATION ON → GPS
  if (settings.autoLocation) {

    final position =
        await ref.watch(locationProvider.future);

    return Coordinates(
      position.latitude,
      position.longitude,
    );
  }

  /// AUTO OFF → Manual Country
  return settings.coordinates;
});
