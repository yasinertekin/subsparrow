import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_price.g.dart';

@JsonSerializable()

/// This class is a sub model of product model.
final class SubPrices with EquatableMixin {
  /// Default constructor
  SubPrices({
    this.basic,
    this.standard,
    this.premium,
  });

  /// Factory method to create a SubPrices instance from JSON
  factory SubPrices.fromJson(Map<String, dynamic> json) => _$SubPricesFromJson(
        json,
      );

  @JsonKey(name: 'basic')

  /// This property is responsible for holding basic subscription price
  final String? basic;
  @JsonKey(name: 'standard')

  /// This property is responsible for holding standard subscription price
  final String? standard;
  @JsonKey(name: 'premium')

  /// This property is responsible for holding premium subscription price
  final String? premium;

  /// Factory method to create a json structure of SubPrices instance
  Map<String, dynamic> toJson() => _$SubPricesToJson(this);

  @override
  List<Object?> get props => [basic, standard, premium];

  /// This method is responsible for creating a copy of SubPrices object
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
