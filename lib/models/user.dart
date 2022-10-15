import 'dart:convert';

import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String gender;
  final String phoneNumber;
  final String birthDay;
  final String pin;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;
  User({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.phoneNumber,
    required this.birthDay,
    required this.pin,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'birthDay': birthDay,
      'pin': pin,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      firstName: map['firstName'] as String,
      middleName: map['middleName'] as String,
      lastName: map['middleName'] as String,
      gender: map['gender'] as String,
      phoneNumber: map['phoneNumber'] as String,
      birthDay: map['birthDay'] as String,
      pin: map['pin'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      type: map['type'] as String,
      token: map['token'] as String, 
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
