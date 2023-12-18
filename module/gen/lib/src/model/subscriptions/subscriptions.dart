import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscriptions.g.dart';

@JsonSerializable()

/// [Subscriptions] is a class that holds the data of a subscription.
final class Subscriptions with EquatableMixin {
  /// [Subscriptions] is a class that holds the data of a subscription.
  Subscriptions({
    this.name,
    this.price,
    this.platformName,
    this.startDate,
    this.endDate,
    this.icon,
    this.status,
  });

  // [Subscriptions] from a [json].
  factory Subscriptions.fromJson(Map<String, dynamic> json) => _$SubscriptionsFromJson(
        json,
      );
  @JsonKey(name: 'name')

  /// [name] is the name of the subscription.
  final String? name;

  @JsonKey(name: 'price')

  /// [price] is the price of the subscription.
  final double? price;
  @JsonKey(name: 'Platform Name')

  /// [platformName] is the platform name of the subscription.
  final String? platformName;
  @JsonKey(name: 'Start Date')

  /// [startDate] is the start date of the subscription.
  final DateTime? startDate;
  @JsonKey(name: 'End Date')

  /// [endDate] is the end date of the subscription.
  final DateTime? endDate;
  @JsonKey(name: 'Icon')

  /// [icon] is the icon of the subscription.
  final String? icon;
  @JsonKey(name: 'Status')

  /// [status] is the status of the subscription.
  final bool? status;

  /// [toJson] is a method that converts a [Subscriptions] into a [json].
  Map<String, dynamic> toJson() => _$SubscriptionsToJson(this);

  @override
  List<Object?> get props => [
        name,
        price,
        platformName,
        startDate,
        endDate,
        icon,
        status,
      ];

  /// [copyWith] is a method that
  /// copies a [Subscriptions] into a new [Subscriptions].
  Subscriptions copyWith({
    String? name,
    double? price,
    String? platformName,
    DateTime? startDate,
    DateTime? endDate,
    String? icon,
    bool? status,
  }) {
    return Subscriptions(
      name: name ?? this.name,
      price: price ?? this.price,
      platformName: platformName ?? platformName,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      icon: icon ?? icon,
      status: status ?? this.status,
    );
  }
}
