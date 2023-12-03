import 'package:equatable/equatable.dart';

/// This class is responsible for creating user object
final class UserModel with EquatableMixin {
  /// This constructor is responsible for creating user object
  UserModel({
    this.email,
    this.password,
  });

  /// This method is responsible for creating user object from json
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  /// This property is responsible for holding user email
  String? email;

  /// This property is responsible for holding user password
  String? password;

  @override
  List<Object?> get props => [email, password];

  /// This method is responsible for creating a copy of user object
  UserModel copyWith({
    String? email,
    String? password,
  }) {
    return UserModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  /// This method is responsible for converting user object to json
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
