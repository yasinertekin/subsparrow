import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends INetworkModel<User> with EquatableMixin {
  User({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  int? userId;
  int? id;
  String? title;
  String? body;

  @override
  User fromJson(Map<String, dynamic> json) => User.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [userId, id, title, body];

  User copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return User(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
