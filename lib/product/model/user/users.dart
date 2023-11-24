import 'package:subsparrow/product/model/subscription/subscription.dart';

///
final class Users {
  ///
  Users({required this.subscriptions});

  ///
  Users.fromJson(Map<String, dynamic> json)
      : subscriptions = (json['subscriptionDetails'] as List<dynamic>?)

                ///
                ?.map((detailJson) => Subscription.fromJson(detailJson as Map<String, dynamic>))
                .toList() ??
            [];

  ///
  final List<Subscription> subscriptions;

  Map<String, dynamic> toJson() {
    return {
      'subscriptionDetails': subscriptions.map((subscription) => subscription.toJson()).toList(),
    };
  }
}
