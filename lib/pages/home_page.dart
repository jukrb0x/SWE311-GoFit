import 'package:GoFit/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getMaterialAppWidget("GoFit");
  }
}

MaterialApp getMaterialAppWidget(String title) {
  return MaterialApp(
    title: title,
    theme: ThemeData(
      primarySwatch: Colors.indigo,
    ),
    home: const Scaffold(
      // todo: splash -> container
      body: HomePageView(title: "Welcome to GoFit"),
    ),
    debugShowCheckedModeBanner: false,
  );
}

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  initState() {
    super.initState();
    Provider.of<UserModel>(context, listen: false).setUsername("Guest");
  }

  _welcomeLogin(String username) {
    return Text(
      "Welcome, $username",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Card(
                child: SizedBox(
                  child: Center(
                      child: Image(
                    image: AssetImage("images/home_head.jpg"),
                  )),
                ),
              ),
              Column(children: [
                SizedBox(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                      Text("GoFit Today",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo)),
                      Text("Keep Fit Everyday",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ])),
              ]),
              Divider(),
              Consumer<UserModel>(
                builder: (context, user, child) => Column(
                  children: [_welcomeLogin(user.username)],
                ),
              )
            ],
          ),
        ],
      ),

      // test code
    );

    Widget _getHomeWidgets(BuildContext context) {}
  }
}
