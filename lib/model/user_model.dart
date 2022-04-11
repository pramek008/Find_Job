// ignore_for_file: unused_import
import 'dart:convert';

class UserModel {
  final String id;
  final String email;
  final String password;
  final String name;
  final String goal;

  UserModel(
    this.id,
    this.email,
    this.password,
    this.name,
    this.goal,
  );

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        password = json['password'],
        name = json['name'],
        goal = json['goal'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
        'name': name,
        'goal': goal
      };
}
