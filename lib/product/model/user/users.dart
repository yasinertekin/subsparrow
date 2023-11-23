import 'package:subsparrow/product/model/sub_detail/subscription_detail.dart';

///
final class Users {
  ///
  Users({required this.subscriptions});

  ///
  Users.fromJson(Map<String, dynamic> json)
      : subscriptions = (json['subscriptionDetails'] as List<dynamic>?)

                ///
                ?.map((detailJson) => SubscriptionDetail.fromJson(detailJson as Map<String, dynamic>))
                .toList() ??
            [];

  ///
  final List<SubscriptionDetail> subscriptions;

  Map<String, dynamic> toJson() {
    return {
      'subscriptionDetails': subscriptions.map((subscription) => subscription.toJson()).toList(),
    };
  }
}
