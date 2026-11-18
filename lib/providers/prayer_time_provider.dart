import 'package:adhan/adhan.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/providers/setting_providers/coordinate_provider.dart';


final prayerTimesProvider =
    FutureProvider<PrayerTimes>((ref) async {

 final coordinates =
    await ref.watch(coordinatesProvider.future);

  final params =
      CalculationMethod.muslim_world_league
          .getParameters();

  params.madhab = Madhab.hanafi;

  final today =
      DateComponents.from(DateTime.now());

  return PrayerTimes(
    coordinates,
    today,
    params,
  );
});
