import 'package:GoFit/api/platform_channel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class UserModel extends ChangeNotifier {
  // native channel
  static const platform = Platforms.platformUser;

  late bool isLogin = false;
  late String username;
  late String password;
  late String email;
  late String weight;
  late String height;
  late String age;
  late String sex;

  void setUsername(String username) {
    username = username;
    notifyListeners();
  }

  void setPassword(String password) {
    password = password;
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    username = username;
    password = password;
    bool result = await platform.invokeMethod('login',
        {'username':username,'password':password}
    );
    print('login: $username $password $result');
    isLogin = result;
    notifyListeners();
    return result;
  }

  Future<bool> register(String username, String password) async {
    username = username;
    password = password;
    bool result = await platform.invokeMethod('register',
        {'username':username,'password':password}
    );
    print('register: $username $password $result');
    notifyListeners();
    return result;

  }
}
