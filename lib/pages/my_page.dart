import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

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
      body: MyPageView(title: "My Fitness"),
    ),
    debugShowCheckedModeBanner: false,
  );
}


class MyPageView extends StatefulWidget {
  const MyPageView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  // database API channel
  static const platform = MethodChannel('com.jb.gofit/test');
  List _userList = ["default"];


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
            ElevatedButton(onPressed: _addTestUser, child: const Text("Add test user")),
            ElevatedButton(onPressed: _getUserList, child:const Text("Show DB") ),


          ],
        ),
      ),
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
