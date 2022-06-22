import 'package:GoFit/model/user_model.dart';
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
              const Divider(),
              ElevatedButton(
                  onPressed: () =>
                      Provider.of<UserModel>(context, listen: false).login(
                          usernameController.text, passwordController.text),
                  child: const Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
