import 'package:adhan/adhan.dart';


String getCurrentPrayer(PrayerTimes times, DateTime now) {
  if (now.isBefore(times.fajr)) return 'Isha';
  if (now.isBefore(times.dhuhr)) return 'Fajr';
  if (now.isBefore(times.asr)) return 'Dhuhr';
  if (now.isBefore(times.maghrib)) return 'Asr';
  if (now.isBefore(times.isha)) return 'Maghrib';
  return 'Isha';
}
