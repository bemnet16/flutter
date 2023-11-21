import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String password;
  final num YearOfStudy;
  final String Program;
  final String role;
  final String? profileImage;
  const User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.password,
    required this.YearOfStudy,
    required this.Program,
    required this.role,
    this.profileImage,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        userName,
        email,
        password,
        YearOfStudy,
        Program,
        role,
        profileImage
      ];

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? userName,
    String? email,
    String? password,
    num? YearOfStudy,
    String? Program,
    String? role,
    String? profileImage,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      YearOfStudy: YearOfStudy ?? this.YearOfStudy,
      Program: Program ?? this.Program,
      role: role ?? this.role,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'userName': userName});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'YearOfStudy': YearOfStudy});
    result.addAll({'Program': Program});
    result.addAll({'role': role});
    if(profileImage != null){
      result.addAll({'profileImage': profileImage});
    }
  
    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'],
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      userName: map['userName'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      YearOfStudy: map['YearOfStudy'] ?? '',
      Program: map['Program'] ?? '',
      role: map['role'] ?? '',
      profileImage: map['profileImage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
