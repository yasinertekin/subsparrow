import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_price.g.dart';

@JsonSerializable(explicitToJson: true)
class SubPrices with EquatableMixin {
  SubPrices({
    this.basic,
    this.standard,
    this.premium,
    this.family,
    this.student,
    this.individual,
    this.deluxe,
    this.essential,
    this.extra,
    this.yearly,
  });

  factory SubPrices.fromJson(Map<String, dynamic> json) => _$SubPricesFromJson(json);

  @JsonKey(name: 'basic')
  final String? basic;
  @JsonKey(name: 'standard')
  final String? standard;
  @JsonKey(name: 'premium')
  final String? premium;
  @JsonKey(name: 'family')
  final String? family;
  @JsonKey(name: 'student')
  final String? student;
  @JsonKey(name: 'individual')
  final String? individual;
  @JsonKey(name: 'deluxe')
  final String? deluxe;
  @JsonKey(name: 'essential')
  final String? essential;
  @JsonKey(name: 'extra')
  final String? extra;
  @JsonKey(name: 'yearly')
  final String? yearly;

  Map<String, dynamic> toJson() => _$SubPricesToJson(this);

  @override
  List<Object?> get props => [basic, standard, premium, family, student, individual, deluxe, essential, extra, yearly];

  SubPrices copyWith({
    String? basic,
    String? standard,
    String? premium,
    String? family,
    String? student,
    String? individual,
    String? deluxe,
    String? essential,
    String? extra,
    String? yearly,
  }) {
    return SubPrices(
      basic: basic ?? this.basic,
      standard: standard ?? this.standard,
      premium: premium ?? this.premium,
      family: family ?? this.family,
      student: student ?? this.student,
      individual: individual ?? this.individual,
      deluxe: deluxe ?? this.deluxe,
      essential: essential ?? this.essential,
      extra: extra ?? this.extra,
      yearly: yearly ?? this.yearly,
    );
  }
}
