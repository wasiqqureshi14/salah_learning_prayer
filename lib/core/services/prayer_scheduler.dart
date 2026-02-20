import 'package:adhan/adhan.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_learning_prayer/core/services/notification_services.dart';
import '../../providers/prayer_time_provider.dart';
import '../../providers/alarm_provider.dart';
import '../../providers/setting_providers/setting_provider.dart';


final prayerSchedulerProvider =
    NotifierProvider<PrayerSchedulerNotifier, void>(
        PrayerSchedulerNotifier.new);

class PrayerSchedulerNotifier extends Notifier<void> {

  @override
  void build() {

    print("✅ Scheduler STARTED");

    Future.microtask(() async {

  final times =
      await ref.read(prayerTimesProvider.future);

  print("✅ Initial prayer times loaded");

  await _schedulePrayers(times);
});


    ref.listen(prayerTimesProvider, (previous, next) async {

      final times = next.when(
        data: (data) => data,
        loading: () => null,
        error: (_, __) => null,
      );

      if (times == null) return;

      print("✅ Prayer times received");

      final settings =
          await ref.read(appSettingsProvider.future);

      final alarms = ref.read(prayerAlarmProvider);

      final prayers = {
        "Fajr": times.fajr,
        "Dhuhr": times.dhuhr,
        "Asr": times.asr,
        "Maghrib": times.maghrib,
        "Isha": times.isha,
      };

      int id = 1;

      for (final entry in prayers.entries) {

        final prayerName = entry.key;

        print("Scheduling $prayerName");

        await NotificationService.schedulePrayer(
          id: id,
          title: prayerName,
          prayerTime:
              DateTime.now().add(const Duration(minutes: 1)),
          showNotification: true,
        );

        id++;
      }
    });
   
  }
  Future<void> _schedulePrayers(PrayerTimes times) async {

  final settings =
      await ref.read(appSettingsProvider.future);

  final alarms = ref.read(prayerAlarmProvider);

  final prayers = {
    "Fajr": times.fajr,
    "Dhuhr": times.dhuhr,
    "Asr": times.asr,
    "Maghrib": times.maghrib,
    "Isha": times.isha,
  };

  int id = 1;

  for (final entry in prayers.entries) {

    final prayerName = entry.key;
    final prayerTime = entry.value;

    print("Scheduling $prayerName at $prayerTime");

    await NotificationService.schedulePrayer(
      id: id,
      title: prayerName,

      /// TEMP TEST
      prayerTime:
          DateTime.now().add(const Duration(minutes: 1)),

      showNotification: true,
    );

    id++;
  }
}

}
