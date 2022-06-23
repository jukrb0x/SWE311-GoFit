import 'package:GoFit/model/user_model.dart';
import 'package:GoFit/pages/login_page.dart';
import 'package:GoFit/pages/my_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // TextEditingController ageController = TextEditingController();
  // TextEditingController heightController = TextEditingController();
  // TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<bool> res;
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                  child: Column(children: <Widget>[
                TextField(
                  controller: usernameController,
                  autofocus: true,
                  decoration: const InputDecoration(
                      labelText: "Username",
                      hintText: "Your username",
                      prefixIcon: Icon(Icons.person)),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      labelText: "Name",
                      hintText: "e.g. John Sena",
                      prefixIcon: Icon(Icons.drive_file_rename_outline)),
                  obscureText: false,
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "your@email.com",
                      prefixIcon: Icon(Icons.email)),
                  obscureText: false,
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Your password",
                      prefixIcon: Icon(Icons.lock)),
                  obscureText: true,
                ),

                const Padding(padding: EdgeInsets.only(top: 20)),
                // const Divider(),
                ElevatedButton(
                  onPressed: () {
                    _register().then((value) => {
                          if (value == true)
                            {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }))
                            }
                          else
                            {
                              showFailedDialog("Register Failed",
                                  "Username could be taken, or your data is invalid. Please try again.")
                            }
                        });
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  child: const Text("Register"),
                )
              ])),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _register() async {
    bool res;
    // empty test
    if (usernameController.text == "" ||
        nameController.text == "" ||
        emailController.text == "" ||
        passwordController.text == "") {
      print("empty");
      return false;
    }

    res = await Provider.of<UserModel>(context, listen: false).register(
        usernameController.text,
        nameController.text,
        emailController.text,
        passwordController.text);
    return res;
  }

  void showFailedDialog(String title, String content) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
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

  void showSnackBarLoginFailed(BuildContext context) {}
}
