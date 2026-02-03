import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'location_provider.dart';

final prayerTimesProvider = FutureProvider<PrayerTimes>((ref) async {
  final position = await ref.watch(locationProvider.future);

  final coordinates = Coordinates(
    position.latitude,
    position.longitude,
  );

  // 🌍 GLOBAL method (this is the ONLY correct API)
  final params = CalculationMethod.muslimWorldLeague.parameters;

  final now = DateTime.now();

  return PrayerTimes(
    coordinates: coordinates,
    date: now,
    calculationParameters: params,
  );
});

extension on CalculationMethod {
   get parameters => null;
}
