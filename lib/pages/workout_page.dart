


import 'package:flutter/material.dart';

class WorkoutPage extends StatelessWidget{
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getWidget();
  }

}

MaterialApp getWidget() {
  return MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.indigo,
    ),
    home: const Scaffold(
    ),
    debugShowCheckedModeBanner: false,
  );
}
