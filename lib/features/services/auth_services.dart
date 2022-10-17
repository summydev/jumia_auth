import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jumia_auth/constants/error_handling.dart';
import 'package:jumia_auth/constants/global_variables.dart';
import 'package:jumia_auth/constants/utils.dart';
import 'package:jumia_auth/features/auth/email/email_login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:jumia_auth/models/user.dart';

class AuthService {
  void signUpuser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          firstName: '',
          middleName: '',
          lastName: '',
          gender: '',
          phoneNumber: '',
          birthDay: '',
          pin: '',
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');
      http.Response res = await http.post(
        Uri.parse('$uri/api/email/signup'),
        body: user.toJson(),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      print(res.statusCode);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackbar(
                context, 'Account created!Login with the same credentials');
          });
    } catch (e) {}
  }

  void checkUser({
    required BuildContext context,
    required String email,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/authemai'),
        body: jsonEncode({'email': email}),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          //"Access-Control-Allow-Origin": "*",
        },
      );
      print(res.statusCode);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EmailSignin(
                        authEmail: email,
                      )),
            );
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
