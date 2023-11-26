import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_price.g.dart';

@JsonSerializable()
@JsonSerializable(explicitToJson: true)
class SubPrices with EquatableMixin {
  SubPrices({
    this.basic,
    this.standard,
    this.premium,
  });

  factory SubPrices.fromJson(Map<String, dynamic> json) => _$SubPricesFromJson(json);

  @JsonKey(name: 'basic')
  final String? basic;
  @JsonKey(name: 'standard')
  final String? standard;
  @JsonKey(name: 'premium')
  final String? premium;

  Map<String, dynamic> toJson() => _$SubPricesToJson(this);

  @override
  List<Object?> get props => [basic, standard, premium];

  SubPrices copyWith({
    String? basic,
    String? standard,
    String? premium,
  }) {
    return SubPrices(
      basic: basic ?? this.basic,
      standard: standard ?? this.standard,
      premium: premium ?? this.premium,
    );
  }
}
