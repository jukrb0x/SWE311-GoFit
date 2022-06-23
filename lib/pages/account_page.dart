import 'package:GoFit/model/user_model.dart';
import 'package:GoFit/pages/my_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<bool> res;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: usernameController,
                autofocus: true,
                decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Your username",
                    prefixIcon: Icon(Icons.person)),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Your password",
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
              ),
              // const Divider(),
              const Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              ElevatedButton(
                  onPressed: () {
                    _login().then((value) => {
                          if (value == true)
                            {
                              // login success
                              // push replace the login page
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return MyPage();
                                }),
                              )
                            }
                          else
                            {
                              // login failed, pop up warning
                            }
                        });
                  },
                  child: Text("Login")),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text("No account?"),
              ElevatedButton(
                onPressed: (){},
                child: Text("s"),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _login() async {
    bool res;
    res = await Provider.of<UserModel>(context, listen: false)
        .login(usernameController.text, passwordController.text);
    return res;
  }

  Future<bool> _register() async {
    bool res;
    res = await Provider.of<UserModel>(context, listen: false)
        .register(usernameController.text, passwordController.text);
    return res;
  }

  void showSnackBarLoginFailed(BuildContext context) {}

}
