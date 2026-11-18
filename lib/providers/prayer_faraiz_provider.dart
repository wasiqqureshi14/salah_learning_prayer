
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/models/prayer_faraiz_model.dart';
import '../data/prayers_data.dart';

final prayerDisplayProvider =
    Provider<List<PrayerDisplayModel>>((ref) {


  int extractFarz(List<String> rakats) {
    int total = 0;

    for (final rakat in rakats) {
      if (rakat.toLowerCase().contains('farz')) {
        final number =
            int.tryParse(rakat.split(' ').first) ?? 0;
        total += number;
      }
    }

    return total;
  }

  return prayerData.entries.map((entry) {
    final prayer = entry.value;

    return PrayerDisplayModel(
      name: prayer.name,
      farzCount: extractFarz(prayer.rakats),
    );
  }).toList();
});
