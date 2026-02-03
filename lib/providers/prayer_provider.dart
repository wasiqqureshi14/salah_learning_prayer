
import 'package:flutter_riverpod/legacy.dart' show StateProvider;
import 'package:salah_learning_prayer/data/prayers_data.dart';
import '../models/prayer_model.dart';

final selectedPrayerProvider =
    StateProvider<PrayerModel>((ref) {
  return prayerData['zohr']!;
});
