import 'package:awesome_notifications/awesome_notifications.dart';

/// Notification service interface
abstract class INotificationService {
  /// Constructor
  INotificationService(this.awesomeNotifications);

  /// Awesome notifications instance
  final AwesomeNotifications awesomeNotifications;

  /// Request user permissions
  Future<void> requestUserPermissions();

  /// Schedule notification
  Future<void> scheduledNotification(
    DateTime dateTime,
    String title,
    String body,
  );

  /// Initialize notifications
  Future<void> initializeNotifications();
}

/// Notification service

class NotificationService implements INotificationService {
  /// Constructor
  NotificationService(this.awesomeNotifications);

  /// Awesome notifications instance
  @override
  final AwesomeNotifications awesomeNotifications;

  /// Request user permissions
  @override
  Future<void> requestUserPermissions() async {
    await awesomeNotifications.requestPermissionToSendNotifications(
      channelKey: 'basic_channel',
    );
  }

  /// Schedule notification
  @override
  Future<void> scheduledNotification(
    DateTime dateTime,
    String title,
    String body,
  ) async {
    await awesomeNotifications.createNotification(
      content: NotificationContent(
        id: 3,
        channelKey: 'basic_channel',
        title: title,
        body: body,
      ),
      schedule: NotificationCalendar.fromDate(
        date: dateTime.add(
          const Duration(seconds: 5),
        ),
      ),
    );
  }

  @override
  Future<void> initializeNotifications() {
    return awesomeNotifications.initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
        ),
      ],
    );
  }
}
