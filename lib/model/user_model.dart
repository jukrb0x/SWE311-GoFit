import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserModel extends ChangeNotifier {
  late String username;
  late String password;

  void setUsername(String username) {
    username = username;
    notifyListeners();
  }

  void setPassword(String password) {
    password = password;
    notifyListeners();
  }

  void login(String username, String password) {
    username = username;
    password = password;
    print('$username $password');
  }
}
