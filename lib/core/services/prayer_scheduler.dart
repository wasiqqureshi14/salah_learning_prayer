import 'package:adhan/adhan.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/core/services/notification_services.dart';
import '../../providers/prayer_time_provider.dart';

final prayerSchedulerProvider =
    NotifierProvider<PrayerSchedulerNotifier, void>(
        PrayerSchedulerNotifier.new);

class PrayerSchedulerNotifier extends Notifier<void> {

  bool _isScheduling = false; // ✅ prevents duplicate runs

  @override
  void build() {
  }

  Future<void> scheduleAllPrayers() async {

    if (_isScheduling) return;

    _isScheduling = true;

    try {

      final times =
          await ref.read(prayerTimesProvider.future);

      print("✅ Scheduling prayers manually");

      final prayers = {
        "Fajr": times.fajr,
        "Dhuhr": times.dhuhr,
        "Asr": times.asr,
        "Maghrib": times.maghrib,
        "Isha": times.isha,
      };

      int id = 1;

      for (final entry in prayers.entries) {

        await NotificationService.schedulePrayer(
          id: id,
          title: entry.key,

          /// TEMP TEST
          prayerTime:
              DateTime.now().add(const Duration(minutes: 1)),

          showNotification: true,
        );

        id++;
      }

    } catch (e) {
      print("Scheduling error: $e");
    }

    _isScheduling = false;
  }
}