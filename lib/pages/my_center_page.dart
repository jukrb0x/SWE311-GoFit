import 'package:GoFit/model/user_model.dart';
import 'package:GoFit/pages/login_page.dart';
import 'package:GoFit/pages/home_page.dart';
import 'package:GoFit/pages/my_page.dart';
import 'package:GoFit/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCenterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyCenterPageState();
}

class _MyCenterPageState extends State<MyCenterPage> {
  // todo get the global state by model
  bool _isLogin = false;

  int _selectedIndex = 0;
  late List<Widget> pages; // container page views

  @override
  void initState() {
    super.initState();
    pages = [_getLoginColumn(context), _getLoggedInColumn(context)];
    _isLogin = Provider.of<UserModel>(context, listen: false).getStatus();
  }

  Widget _getView(BuildContext context, bool isLogin) {
    int index;
    if (isLogin) {
      index = 0;
    } else {
      index = 1;
    }
    // return Offstage(
    //     // prevent disordering
    //     offstage: _selectedIndex != index,
    //     child: TickerMode(
    //       enabled: _selectedIndex == index,
    //       child: pages[index],
    //     ));

    if (!isLogin) {
      return _getLoginColumn(context);
    } else {
      return _getLoggedInColumn(context);
    }
  }

  Column _getLoggedInColumn(BuildContext context) {
    // todo
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Center(
              child: Text("ss"),
            ),
          ),
        )
        // TextField(), Text("logged in")
      ],
    );
  }

  Column _getLoginColumn(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text(
              '💪',
              style: TextStyle(
                fontSize: 80,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: ,
            children: [
              const Text("Login before build your body",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              const Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }),
                        );
                      },
                      child: Text("Login")),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return RegisterPage();
                        }),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: const Text("Register"),
                  ),
                ],
              )
            ],
          ),
        ),
        const Text("SWE311")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: _getView(context, _isLogin)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeStat();
        },
        tooltip: 'Test Change',
        child: const Icon(Icons.cleaning_services),
      ),
    );
  }

  _changeStat() {
    setState(() {
      _isLogin = !_isLogin;

      if(_isLogin == true){
        _selectedIndex = 1;
      } else {
        _selectedIndex = 0;
      }

      print("isLogin? " + _isLogin.toString());
      print("page index " + _selectedIndex.toString());
    });
  }
}

// testing code
class ListItem {
  final String title;
  final IconData iconData;

  ListItem(this.title, this.iconData);
}

class ListItemWidget extends StatelessWidget {
  const ListItemWidget(this.listItem);

  final ListItem listItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: Icon(listItem.iconData),
        title: Text(listItem.title),
      ),
      onTap: () {},
    );
  }
}
