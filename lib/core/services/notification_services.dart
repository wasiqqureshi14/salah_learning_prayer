import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {

  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static bool _initialized = false;

  /// ================= INIT =================
  static Future<void> init() async {

    if (_initialized) return; // ✅ prevents re-init

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Karachi'));

    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const settings =
        InitializationSettings(android: androidSettings);

    await _plugin.initialize( settings: settings);

    const channel = AndroidNotificationChannel(
      'prayer_channel_id',
      'Prayer Notifications',
      description: 'Prayer time alerts',
      importance: Importance.max,
    );

    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    _initialized = true;

    print("✅ Notification initialized");
  }

  /// ================= SCHEDULE =================
  static Future<void> schedulePrayer({
    required int id,
    required String title,
    required DateTime prayerTime,
    required bool showNotification,
  }) async {

    if (!_initialized) return; // ✅ no work before init

    final scheduled =
        tz.TZDateTime.from(prayerTime, tz.local);

    await _plugin.zonedSchedule(
      id: id,
     title:  title,
      body: "It's time for prayer",
      scheduledDate: scheduled,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          'prayer_channel_id',
          'Prayer Notifications',
          channelDescription: 'Prayer time alerts',
          importance: Importance.max,
          priority: Priority.high,
          playSound: showNotification,
          enableVibration: showNotification,
        ),
      ),
      androidScheduleMode:
          AndroidScheduleMode.exactAllowWhileIdle,
    );

    print("✅ Scheduled $title");
  }

  static Future<void> cancelPrayer(int id) async {
    await _plugin.cancel(id:id);
  }

  static Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }
}