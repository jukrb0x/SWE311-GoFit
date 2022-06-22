import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getMaterialAppWidget("Go Fit");
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
      body: HomePageView(title: "Welcome"),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

          ],
        ),
      ),
      // test code
    );
  }
}
