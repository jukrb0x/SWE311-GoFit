import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // app entry
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Fit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Go Fit'),
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
  static const platform = MethodChannel('com.jb.gofit/test');
  List _userList = ["default"];
  int _counter = 0;

  Future<void> _getUserList() async {
    final List<dynamic> result = await platform.invokeMethod('getUserList');
    setState(() {
      _userList = result;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  Future<void> _addTestUser() async {
    await platform.invokeListMethod('addUserTest');
  }
  
  Future<void> _clearDatabase() async {
    await platform.invokeListMethod('clearDatabase');
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
            Text('$_counter'),
            ElevatedButton(onPressed: _addTestUser, child: const Text("Add test user")),
            ElevatedButton(onPressed: _clearDatabase, child:const Text("Clear DB") )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {_getUserList();_incrementCounter();},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

