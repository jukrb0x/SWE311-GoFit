

import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget{
  const CoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getMaterialAppWidget();
  }

}
  MaterialApp getMaterialAppWidget() {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const Scaffold(
      ),
      debugShowCheckedModeBanner: false,
    );
  }
