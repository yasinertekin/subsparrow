import 'package:gen/src/model/subscriptions/subscriptions.dart';

/// Represents a collection of subscriptions.
final class Users {
  /// Creates a [Users] instance.
  Users({required this.subscriptions});

  /// Creates a [Users] instance from a JSON representation.
  Users.fromJson(Map<String, dynamic> json)
      : subscriptions = (json['subscriptionDetails'] as List<dynamic>?)

                ///
                ?.map(
                  (detailJson) => Subscriptions.fromJson(
                    detailJson as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [];

  /// A list of subscriptions in the collection.
  final List<Subscriptions> subscriptions;

  /// Converts the [Users] instance to a JSON representation.
  Map<String, dynamic> toJson() {
    return {
      'subscriptionDetails': subscriptions
          .map(
            (subscription) => subscription.toJson(),
          )
          .toList(),
    };
  }
}
