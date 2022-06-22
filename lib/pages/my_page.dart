import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:GoFit/widgets/setting_item.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

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

  /// start
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

  /// end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, left: 2, right: 2),
            ),
            _MyItem(
              iconData: Icons.login,
              iconColor: Colors.blue,
              title: 'Login',
            ),
            Divider(),
            _MyItem(
              iconData: Icons.app_registration,
              iconColor: Colors.orange,
              title: '消息中心',
            ),
            Divider(),
          ],

        ),
      ),
    );
  }
}

SliverToBoxAdapter _personItem(IconData iconData, Color iconColor, String title,
    {VoidCallback? onTap}) {
  return SliverToBoxAdapter(
    child: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                iconData,
                color: iconColor,
              )),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 15.0),
            ),
          ),
        ],
      ),
    ),
  );
}

class _MyItem extends StatelessWidget {
  const _MyItem(
      {Key? key,
      required this.iconData,
      required this.iconColor,
      required this.title,
      this.suffix})
      : super(key: key);

  final IconData iconData;
  final Color iconColor;
  final String title;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 30,
          ),
          Icon(
            iconData,
            color: iconColor,
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Text(title),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
