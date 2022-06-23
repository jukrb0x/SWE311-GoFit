import 'package:GoFit/layout/container.dart';
import 'package:GoFit/model/user_model.dart';
import 'package:GoFit/pages/home_page.dart';
import 'package:GoFit/pages/my_center_page.dart';
import 'package:GoFit/pages/my_page.dart';
import 'package:GoFit/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                decoration: const InputDecoration(
                    labelText: "Username",
                    hintText: "Your username",
                    prefixIcon: Icon(Icons.person)),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
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
                                  // notify my fit reset
                                  return ContainerWidget();
                                }),
                              )
                            }
                          else
                            {
                              // login failed, pop up warning
                              showFailedDialog(
                                  "Login Failed",
                                  "Please check your credentials."
                              )

                            }
                        });
                  },
                  child: const Text("Login")),
              const Padding(padding: EdgeInsets.only(top: 20)),
              const Text("No account?"),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return RegisterPage();
                    }),
                  );
                },
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text("Register"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _login() async {
    if(usernameController.text =="" || passwordController.text ==""){
      print("empty");
      return false;
    }
    bool res;
    res = await Provider.of<UserModel>(context, listen: false)
        .login(usernameController.text, passwordController.text);
    return res;
  }


  void showFailedDialog(String title, String content) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ));
  }

}
