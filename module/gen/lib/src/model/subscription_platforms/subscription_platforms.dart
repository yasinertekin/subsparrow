import 'package:equatable/equatable.dart';
import 'package:gen/src/model/subscriptions/subscriptions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscription_platforms.g.dart';

@JsonSerializable()

/// [SubscriptionPlatforms] is a class that holds
/// the data of a subscription platform.
final class SubscriptionPlatforms extends Equatable {
  /// [SubscriptionPlatforms] is a class that holds
  /// the data of a subscription platform.
  const SubscriptionPlatforms({
    this.subIcon,
    this.subscriptions,
    this.subName,
  });

  /// [SubscriptionPlatforms] is a class that holds
  ///  the data of a subscription platform.
  factory SubscriptionPlatforms.fromJson(Map<String, dynamic> json) => _$SubscriptionPlatformsFromJson(
        json,
      );

  @JsonKey(name: 'Icon')

  /// [subIcon] is the icon of the subscription platform.
  final String? subIcon;
  @JsonKey(name: 'subscriptions')

  /// [subscriptions] is the list of subscriptions.
  final List<Subscriptions>? subscriptions;
  @JsonKey(name: 'Name')

  /// [subName] is the name of the subscription platform.
  final String? subName;

  /// [toJson] is a method that converts a [SubscriptionPlatforms] to a [Map].
  Map<String, dynamic> toJson() => _$SubscriptionPlatformsToJson(this);

  @override
  List<Object?> get props => [subIcon, subscriptions, subName];

  /// [copyWith] is a method that copies a [SubscriptionPlatforms]
  ///  to a new [SubscriptionPlatforms].
  SubscriptionPlatforms copyWith({
    String? subIcon,
    List<Subscriptions>? subscriptions,
    String? subName,
  }) {
    return SubscriptionPlatforms(
      subIcon: subIcon ?? subIcon,
      subscriptions: subscriptions ?? this.subscriptions,
      subName: subName ?? this.subName,
    );
  }
}
