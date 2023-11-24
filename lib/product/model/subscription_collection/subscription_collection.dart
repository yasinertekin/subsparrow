import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:subsparrow/product/model/subscription/subscription.dart';
import 'package:subsparrow/product/utility/base/base_firebase_model.dart';

part 'subscription_collection.g.dart';

@JsonSerializable()
class SubscriptionCollection extends Equatable with BaseFireBaseModel<SubscriptionCollection>, IdModel {
  const SubscriptionCollection({
    this.subscriptions,
  });

  factory SubscriptionCollection.fromJson(Map<String, dynamic> json) => _$SubscriptionCollectionFromJson(json);

  final List<Subscription>? subscriptions;

  @override
  List<Object?> get props => [subscriptions];

  SubscriptionCollection copyWith({
    List<Subscription>? subscriptions,
  }) {
    return SubscriptionCollection(
      subscriptions: subscriptions ?? this.subscriptions,
    );
  }

  @override
  SubscriptionCollection fromJson(Map<String, dynamic> json) {
    return SubscriptionCollection.fromJson(json);
  }

  @override
  String? get id => null;

  // Add the toJson method
  Map<String, dynamic> toJson() => _$SubscriptionCollectionToJson(this);
}
