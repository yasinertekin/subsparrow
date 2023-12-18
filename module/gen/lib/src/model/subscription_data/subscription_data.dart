import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gen/src/model/subscription_platforms/subscription_platforms.dart';

/// [SubscriptionData] is a class that holds the data of a subscription.
final class SubscriptionData {
  /// [SubscriptionData] is a class that holds the data of a subscription.
  SubscriptionData({
    required this.id,
    required this.data,
  });

  ///  from a [DocumentSnapshot].
  factory SubscriptionData.fromFirestore(DocumentSnapshot doc) {
    return SubscriptionData(
      id: doc.id,
      data: SubscriptionPlatforms.fromJson(doc.data()! as Map<String, dynamic>),
    );
  }

  /// [id] is the id of the subscription.
  final String id;

  /// [data] is the data of the subscription.
  final SubscriptionPlatforms data;
}
