import 'package:equatable/equatable.dart';

final class Auth with EquatableMixin {
  Auth({
    this.email,
    this.password,
  });

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }
  String? email;
  String? password;

  @override
  List<Object?> get props => [email, password];

  Auth copyWith({
    String? email,
    String? password,
  }) {
    return Auth(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
