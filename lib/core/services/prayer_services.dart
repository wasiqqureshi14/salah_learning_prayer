import 'package:adhan/adhan.dart';

class PrayerService {

  static DateTime getPrayerEndTime(
    Prayer currentPrayer,
    PrayerTimes times,
  ) {
    switch (currentPrayer) {

      case Prayer.fajr:
        return times.sunrise;

      case Prayer.dhuhr:
        return times.asr;

      case Prayer.asr:
        return times.maghrib;

      case Prayer.maghrib:
        return times.isha;

      case Prayer.isha:

        final maghrib = times.maghrib;
        final fajr = times.fajr.add(const Duration(days: 1));

        final nightDuration = fajr.difference(maghrib);

        return maghrib.add(
          Duration(minutes: nightDuration.inMinutes ~/ 2),
        );

      default:
        return times.fajr;
    }
  }

  static Duration? getRemainingTime(PrayerTimes times) {

    final now = DateTime.now();
    final currentPrayer = times.currentPrayer();

    final endTime = getPrayerEndTime(
      currentPrayer,
      times,
    );

    if (now.isAfter(endTime)) {
      return null;
    }

    final nextPrayer = times.nextPrayer();
    final nextTime = times.timeForPrayer(nextPrayer);

    if (nextTime == null) return null;

    return nextTime.difference(now);
  }
}
