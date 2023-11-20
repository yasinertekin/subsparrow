import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscription_detail.g.dart';

@JsonSerializable()
final class SubscriptionDetail with EquatableMixin {
  SubscriptionDetail({
    this.id,
    this.subIcon,
    this.subPrice,
    this.subName,
  });

  factory SubscriptionDetail.fromJson(Map<String, dynamic> json) => _$SubscriptionDetailFromJson(json);
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'subIcon')
  String? subIcon;
  @JsonKey(name: 'subPrice')
  String? subPrice;
  @JsonKey(name: 'subName')
  String? subName;

  Map<String, dynamic> toJson() => _$SubscriptionDetailToJson(this);

  @override
  List<Object?> get props => [id, subIcon, subPrice, subName];

  SubscriptionDetail copyWith({
    String? id,
    String? subIcon,
    String? subPrice,
    String? subName,
  }) {
    return SubscriptionDetail(
      id: id ?? this.id,
      subIcon: subIcon ?? this.subIcon,
      subPrice: subPrice ?? this.subPrice,
      subName: subName ?? this.subName,
    );
  }
}
