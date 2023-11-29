import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:subsparrow/product/model/subscription/subscription.dart';
import 'package:subsparrow/product/utility/base/base_firebase_model.dart';

part 'subscription_collection.g.dart';

/// Represents a collection of subscriptions.
@JsonSerializable()
class SubscriptionCollection extends Equatable with BaseFireBaseModel<SubscriptionCollection>, IdModel {
  /// Creates a [SubscriptionCollection] instance.

  const SubscriptionCollection({
    this.subscriptions,
  });

  /// Creates a [SubscriptionCollection] instance from a JSON representation.
  factory SubscriptionCollection.fromJson(Map<String, dynamic> json) => _$SubscriptionCollectionFromJson(
        json,
      );

  /// A list of subscriptions in the collection.

  final List<Subscription>? subscriptions;

  @override
  List<Object?> get props => [subscriptions];

  /// Creates a copy of the [SubscriptionCollection] with some fields replaced.

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

  /// Converts the [SubscriptionCollection] instance to a JSON representation.

  Map<String, dynamic> toJson() => _$SubscriptionCollectionToJson(this);
}
