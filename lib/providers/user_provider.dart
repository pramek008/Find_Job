// ignore_for_file: non_constant_identifier_names

import 'package:findjob/model/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  // ignore: unused_field
  UserModel _user;

  UserModel get user => _user;

  set user(UserModel newUser) {
    _user = newUser;
    notifyListeners();
  }
}
