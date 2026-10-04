import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin
      flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    // Timezone initialization
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: (response) {
        print('Notification clicked: ${response.payload}');
      },
    );
  }

  static Future<void> showNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'default_channel',
      'Default Notifications',
      channelDescription: 'Default notification channel',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(),
    );

    await flutterLocalNotificationsPlugin.show(
      id: 1,
      title: 'Hello 👋',
      body: 'This is a local notification',
      notificationDetails: details,
      payload: 'notification_1',
    );
  }

  static Future<void> scheduleNotification() async {
    final scheduledDate = tz.TZDateTime.now(tz.local).add(
      const Duration(minutes: 1),
    );

    print('Now: ${tz.TZDateTime.now(tz.local)}');
    print('Scheduled: $scheduledDate');

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'reminder_channel',
      'Reminders',
      channelDescription: 'Reminder notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(),
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id: 1,
      title: 'Reminder 1',
      body: 'Your 1 minute reminder',
      scheduledDate: scheduledDate,
      notificationDetails: details,
      androidScheduleMode:
          AndroidScheduleMode.exactAllowWhileIdle, // Use exact scheduling for Android
      payload: 'one_minute_reminder',
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id: 2,
      title: 'Reminder 2',
      body: 'Your 1 minute reminder',
      scheduledDate: scheduledDate,
      notificationDetails: details,
      androidScheduleMode:
          AndroidScheduleMode.exactAllowWhileIdle, // Use exact scheduling for Android
      payload: 'one_minute_reminder',
    );

    print('Notification scheduled successfully');
  }

  static Future<void> requestPermission() async {
    final androidImplementation =
        flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>();

    final permission =
        await androidImplementation?.requestNotificationsPermission();

    print('Notification permission: $permission');

    final iosImplementation =
        flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin>();

    await iosImplementation?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}