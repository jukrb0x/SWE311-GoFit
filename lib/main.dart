import 'dart:io';

import 'package:GoFit/model/user_model.dart';
import 'package:GoFit/pages/splash.dart';
import 'package:GoFit/layout/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  // app entry

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserModel())
        ],
        child: MyApp(),
      ),
      // const MyApp()
          // add routers here
  );
  if (Platform.isAndroid) {
    // transparent status bar
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Fit',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // home: const MyHomePage(title: 'Go Fit'),
      home: const Scaffold(
        // todo: splash -> container
        body: ContainerWidget(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // database API channel
  static const platform = MethodChannel('com.jb.gofit/test');
  List _userList = ["default"];

  // Navigation bar
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  Future<void> _getUserList() async {
    final List<dynamic> result = await platform.invokeMethod('getUserList');
    setState(() {
      _userList = result;
    });
  }

  Future<void> _addTestUser() async {
    await platform.invokeListMethod('addUserTest');
  }

  Future<void> _clearDatabase() async {
    await platform.invokeListMethod('clearDatabase');
    print("clear database");
  }

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
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            Text('$_userList'),
            Text('$_selectedIndex'),
            ElevatedButton(onPressed: _addTestUser, child: const Text("Add test user")),
            ElevatedButton(onPressed: _getUserList, child:const Text("Show DB") ),


          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.houseboat),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Workout',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'My Fit',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo[500],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },),

      // test code
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _clearDatabase();
        },
        tooltip: 'Clear Database',
        child: const Icon(Icons.cleaning_services),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
