import 'package:adhan/adhan.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'location_provider.dart';

final prayerTimesProvider = FutureProvider<PrayerTimes>((ref) async {

  final position = await ref.watch(locationProvider.future);

  final coordinates = Coordinates(
    position.latitude,
    position.longitude,
  );

  final params = CalculationMethod.muslim_world_league.getParameters();

  params.madhab = Madhab.hanafi; 

  final date = DateComponents.from(DateTime.now());

  return PrayerTimes(
    coordinates,
    date,
    params,
  );
});
