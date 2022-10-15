import 'package:flutter/material.dart';
import 'package:jumia_auth/models/user.dart';

class UserProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  User _user = User(
    id: '',
    firstName:'',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '', 
    pin: '', 
    birthDay: '',
     lastName: '', 
     middleName: '',
      gender: '', 
      phoneNumber: '',
  );

  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
