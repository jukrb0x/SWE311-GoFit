


import 'package:flutter/material.dart';

class WorkoutPage extends StatelessWidget{
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getMaterialAppWidget();
  }

}

MaterialApp getMaterialAppWidget() {
  return MaterialApp(
    title: "Go Fit",
    theme: ThemeData(
      primarySwatch: Colors.indigo,
    ),
    home: const Scaffold(
    ),
    debugShowCheckedModeBanner: false,
  );
}
