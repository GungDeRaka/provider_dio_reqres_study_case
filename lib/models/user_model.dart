// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.avatar,
    required this.email,
    required this.firstName,
    required this.id,
    required this.lastName,
  });

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      avatar: map['avatar'] as String,
      email: map['email'] as String,
      firstName: map['first_name'] as String,
      id: map['id'] as int,
      lastName: map['last_name'] as String,
    );
  }

  final String avatar;
  final String email;
  final String firstName;
  final int id;
  final String lastName;

  @override
  List<Object> get props {
    return [
      avatar,
      email,
      firstName,
      id,
      lastName,
    ];
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'avatar': avatar,
      'email': email,
      'firstName': firstName,
      'id': id,
      'lastName': lastName,
    };
  }

  String toJson() => json.encode(toMap());

  UserModel copyWith({
    String? avatar,
    String? email,
    String? firstName,
    int? id,
    String? lastName,
  }) {
    return UserModel(
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
    );
  }
}
