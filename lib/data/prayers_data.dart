import '../models/prayer_model.dart';

const Map<String, PrayerModel> prayerData = {
  'fajr': PrayerModel(
    name: 'Fajr',
    rakats: [
      '2 Rakats Sunnah',
      '2 Rakats Farz',
    ],
  ),

  'dhuhr': PrayerModel(
    name: 'dhuhr',
    rakats: [
      '4 Rakats Sunnah',
      '4 Rakats Farz',
      '2 Rakats Sunnah',
      '2 Rakats Nafl',
    ],
  ),

  'asr': PrayerModel(
    name: 'Asr',
    rakats: [
      '4 Rakats Sunnah',
      '4 Rakats Farz',
    ],
  ),

  'maghrib': PrayerModel(
    name: 'Maghrib',
    rakats: [
      '3 Rakats Farz',
      '2 Rakats Sunnah',
      '2 Rakats Nafl',
    ],
  ),

  'isha': PrayerModel(
    name: 'Isha',
    rakats: [
      '4 Rakats Sunnah',
      '4 Rakats Farz',
      '2 Rakats Sunnah',
      '2 Rakats Nafl',
      '3 Rakats Witr',
    ],
  ),
};
