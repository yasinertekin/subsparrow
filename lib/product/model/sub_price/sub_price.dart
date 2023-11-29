import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_price.g.dart';

/// Represents the pricing details for different subscription plans.
@JsonSerializable(explicitToJson: true)
class SubPrices with EquatableMixin {
  /// SubPrices constructor
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

  /// Creates a [SubPrices] instance from a JSON representation.
  factory SubPrices.fromJson(Map<String, dynamic> json) => _$SubPricesFromJson(
        json,
      );

  /// Basic subscription price.
  @JsonKey(name: 'basic')
  final String? basic;

  /// Standard subscription price.

  @JsonKey(name: 'standard')
  final String? standard;

  @JsonKey(name: 'premium')

  /// Premium subscription price.

  final String? premium;
  @JsonKey(name: 'family')

  /// Family subscription price.

  final String? family;
  @JsonKey(name: 'student')

  /// Student subscription price.

  final String? student;
  @JsonKey(name: 'individual')

  /// Individual subscription price.

  final String? individual;

  @JsonKey(name: 'deluxe')

  /// Deluxe subscription price.

  final String? deluxe;
  @JsonKey(name: 'essential')

  /// Essential subscription price.

  final String? essential;
  @JsonKey(name: 'extra')

  /// Extra subscription price.

  final String? extra;
  @JsonKey(name: 'yearly')

  /// Yearly subscription price.

  final String? yearly;

  /// Converts the [SubPrices] instance to a JSON representation.

  Map<String, dynamic> toJson() => _$SubPricesToJson(this);

  @override
  List<Object?> get props => [
        basic,
        standard,
        premium,
        family,
        student,
        individual,
        deluxe,
        essential,
        extra,
        yearly,
      ];

  /// Creates a new [SubPrices] instance by copying the existing one and
  /// replacing some of its values.
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
