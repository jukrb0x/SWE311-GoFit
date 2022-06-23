import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);

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
      body: CoursePageView(title: "GoFit"),
    ),
    debugShowCheckedModeBanner: false,
  );
}


class CoursePageView extends StatefulWidget {
  const CoursePageView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CoursePageView> createState() => _CoursePageViewState();
}

class _CoursePageViewState extends State<CoursePageView> {
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
