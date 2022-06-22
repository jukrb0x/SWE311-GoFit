import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getWidget();
  }
}

MaterialApp getWidget() {
  return MaterialApp(
    title: 'Go Fit',
    theme: ThemeData(
      primarySwatch: Colors.indigo,
    ),
    home: const Scaffold(
      // todo: splash -> container
      body: HomePageView(title: "GO FIT"),
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
