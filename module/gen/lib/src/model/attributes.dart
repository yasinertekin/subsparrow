import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attributes.g.dart';

@JsonSerializable()
@immutable
final class Attributes with EquatableMixin {
  const Attributes({
    this.title,
    this.body,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => _$AttributesFromJson(json);
  final String? title;
  final String? body;

  Map<String, dynamic> toJson() => _$AttributesToJson(this);

  @override
  List<Object?> get props => [title, body];

  Attributes copyWith({
    String? title,
    String? body,
  }) {
    return Attributes(
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
