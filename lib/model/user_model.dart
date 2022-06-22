import 'package:GoFit/api/platform_channel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class UserModel extends ChangeNotifier {
  // native channel
  static const platform = Platforms.platformUser;

  late bool isLogin;
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

  Future<bool> login(String username, String password) async {
    username = username;
    password = password;
    bool result = await platform.invokeMethod('login',
        {'username':username,'password':password}
    );
    print('$username $password $result');
    return result;
  }

  void register(String username, String password) {
    username = username;
    password = password;

  }
}
