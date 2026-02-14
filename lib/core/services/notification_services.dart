/*import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {

  static final FlutterLocalNotificationsPlugin
      _notifications = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {

    tz.initializeTimeZones();

    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const settings =
        InitializationSettings(android: androidSettings);

    await _notifications.initialize(settings);
  }

  /// ================= SCHEDULE PRAYER =================
  static Future<void> schedulePrayer({
    required int id,
    required String title,
    required DateTime prayerTime,
  }) async {

    final scheduledDate =
        tz.TZDateTime.from(prayerTime, tz.local);

    await _notifications.zonedSchedule(
      id,
      title,
      "Prayer time has started",
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'prayer_channel',
          'Prayer Notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode:
          AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  /// ================= CANCEL =================
  static Future<void> cancel(int id) async {
    await _notifications.cancel(id);
  }
}
*/