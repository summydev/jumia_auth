import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jumia_auth/constants/error_handling.dart';
import 'package:jumia_auth/constants/global_variables.dart';
import 'package:jumia_auth/constants/utils.dart';
import 'package:jumia_auth/features/auth/email/email_login.dart';
import 'package:jumia_auth/features/auth/email/email_signup.dart';
import 'package:jumia_auth/features/profile/account_created_screen.dart';
import 'package:jumia_auth/features/profile/morepersonaldetails.dart';
import 'package:jumia_auth/features/profile/personal_details_screen.dart';
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
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PersonalDetails(authEmail: email)),
            );
          });
    } catch (e) {}
  }

  void checkUserExists({
    required BuildContext context,
    required String email,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/authemail'),
        body: jsonEncode({'email': email}),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          //"Access-Control-Allow-Origin": "*",
        },
      );

      print(res.statusCode);
      if (res.statusCode == 200) {
        // print(res.statusCode);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EmailSignin(
                    authEmail: email,
                  )),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EmailSignup(
                    authEmail: email,
                  )),
        );
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void addPersonalDetails({
    required BuildContext context,
    required String email,
    required String firstName,
    required String middleName,
    required String lastName,
    required String phoneNumber,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/email/signup-details'),
        body: jsonEncode({
          'email': email,
          'firstName': firstName,
          'middleName': middleName,
          'lastName': lastName,
          'phoneNumber': phoneNumber
        }),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          //"Access-Control-Allow-Origin": "*",
        },
      );

      print(res.statusCode);
      if (res.statusCode == 200) {
        // print(res.statusCode);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => morePersonalDetails(authEmail: email)),
        );
      } else {
        showSnackbar(context, 'something went wrong');
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void addMorePersonalDetails({
    required BuildContext context,
    required String email,
    required String gender,
    required String birthDay,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/email/signup-details-more'),
        body: jsonEncode({
          'email': email,
          'gender': gender,
          'birthDay': birthDay,
        }),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          //"Access-Control-Allow-Origin": "*",
        },
      );

      print(res.statusCode);
      if (res.statusCode == 200) {
        // print(res.statusCode);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AccountCreatedScreen(firstName: 'RAndom')),
        );
        showSnackbar(context, 'redirecting you');
      } else {
        showSnackbar(context, 'something went wrong');
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
