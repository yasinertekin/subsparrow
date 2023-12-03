import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subscriptions.g.dart';

@JsonSerializable()
class Subscriptions with EquatableMixin {
  Subscriptions({
    this.name,
    this.price,
    this.platformName,
    this.startDate,
    this.endDate,
    this.icon,
    this.status,
  });

  factory Subscriptions.fromJson(Map<String, dynamic> json) => _$SubscriptionsFromJson(json);
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'price')
  final double? price;
  @JsonKey(name: 'Platform Name')
  final String? platformName;
  @JsonKey(name: 'Start Date')
  final DateTime? startDate;
  @JsonKey(name: 'End Date')
  final DateTime? endDate;
  @JsonKey(name: 'Icon')
  final String? icon;
  @JsonKey(name: 'Status')
  final bool? status;

  Map<String, dynamic> toJson() => _$SubscriptionsToJson(this);

  @override
  List<Object?> get props => [name, price, platformName, startDate, endDate, icon, status];

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
