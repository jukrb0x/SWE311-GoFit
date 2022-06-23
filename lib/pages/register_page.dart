import 'package:GoFit/model/user_model.dart';
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
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

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
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
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
              const Padding(padding: EdgeInsets.only(top: 20)),
              ElevatedButton(
                onPressed: () {},
                child: Text("Register"),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _register() async {
    bool res;
    res = await Provider.of<UserModel>(context, listen: false)
        .register(
        usernameController.text, passwordController.text
    );
    return res;
  }

  void showSnackBarLoginFailed(BuildContext context) {}
}
