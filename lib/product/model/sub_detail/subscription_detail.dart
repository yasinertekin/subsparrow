import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscription_detail.g.dart';

@JsonSerializable()
final class SubscriptionDetail extends Equatable {
  const SubscriptionDetail({
    this.subPrice,
    this.subIcon,
    this.subName,
    this.subId,
  });

  factory SubscriptionDetail.fromJson(Map<String, dynamic> json) => _$SubscriptionDetailFromJson(json);
  @JsonKey(name: 'subPrice')
  final String? subPrice;
  @JsonKey(name: 'subIcon')
  final String? subIcon;
  @JsonKey(name: 'subName')
  final String? subName;
  @JsonKey(name: 'subId')
  final String? subId;

  Map<String, dynamic> toJson() => _$SubscriptionDetailToJson(this);

  @override
  List<Object?> get props => [subPrice, subIcon, subName];

  SubscriptionDetail copyWith({
    String? subPrice,
    String? subIcon,
    String? subName,
    String? subId,
  }) {
    return SubscriptionDetail(
      subPrice: subPrice ?? this.subPrice,
      subIcon: subIcon ?? this.subIcon,
      subName: subName ?? this.subName,
      subId: subId ?? this.subId,
    );
  }
}
