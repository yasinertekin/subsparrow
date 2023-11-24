import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:subsparrow/product/model/sub_price/sub_price.dart';

part 'subscription.g.dart';

@JsonSerializable()

/// This class is responsible for creating subscription object
final class Subscription with EquatableMixin {
  /// This constructor is responsible for creating subscription object
  Subscription({
    this.subId,
    this.subName,
    this.subType,
    this.subBasePrice,
    this.subPrices,
    this.startDate,
    this.endDate,
    this.status,
    this.subIcon,
    this.subOnePrice,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(
        json,
      );
  @JsonKey(name: 'subId')

  /// This property is responsible for holding subscription id
  final String? subId;
  @JsonKey(name: 'subName')

  /// This property is responsible for holding subscription name
  final String? subName;
  @JsonKey(name: 'subType')

  /// This property is responsible for holding subscription type
  final String? subType;
  @JsonKey(name: 'subBasePrice')

  /// This property is responsible for holding subscription base price
  final String? subBasePrice;
  // @JsonKey(name: 'subPrices')

  /// This property is responsible for holding subscription prices
  final List<SubPrices>? subPrices;
  @JsonKey(name: 'subStartDate')

  /// This property is responsible for holding subscription start date
  final DateTime? startDate;
  @JsonKey(name: 'subEndDate')

  /// This property is responsible for holding subscription end date
  final DateTime? endDate;
  @JsonKey(name: 'status')

  /// This property is responsible for holding subscription status
  final bool? status;
  @JsonKey(name: 'subIcon')

  /// This property is responsible for holding subscription icon
  final String? subIcon;

  /// This property is responsible for holding subscription one month
  @JsonKey(name: 'subOnePrice')
  final bool? subOnePrice;

  /// This function is responsible for converting subscription object to json
  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);

  @override
  List<Object?> get props => [
        subId,
        subName,
        subType,
        subBasePrice,
        subPrices,
        startDate,
        endDate,
        status,
        subIcon,
      ];

  ///This function is responsible for copying subscription object with new values
  Subscription copyWith({
    String? subId,
    String? subName,
    String? subType,
    String? subBasePrice,
    List<SubPrices>? subPrices,
    DateTime? startDate,
    DateTime? endDate,
    bool? status,
    String? subIcon,
    bool? subOneMonth,
  }) {
    return Subscription(
      subId: subId ?? this.subId,
      subName: subName ?? this.subName,
      subType: subType ?? this.subType,
      subBasePrice: subBasePrice ?? this.subBasePrice,
      subPrices: subPrices ?? this.subPrices,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      subIcon: subIcon ?? this.subIcon,
      subOnePrice: subOneMonth ?? subOnePrice,
    );
  }
}
