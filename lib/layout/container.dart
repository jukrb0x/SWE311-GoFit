import 'package:GoFit/pages/course_page.dart';
import 'package:GoFit/pages/home_page.dart';
import 'package:GoFit/pages/my_page.dart';
import 'package:GoFit/pages/workout_page.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({Key? key}) : super(key: key);

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class NavItem {
  String label;
  IconData iconData; // Material IconData
  MaterialColor? backgroundColor;

  NavItem(this.label, this.iconData);

  void setColor(MaterialColor color) {
    backgroundColor = color;
  }
}

class _ContainerWidgetState extends State<ContainerWidget> {
  // todo: container -> home page knows the user login state

  late List<Widget> pages; // container page views
  List<NavItem> navItems = [
    NavItem('Home', Icons.home),
    NavItem('Course', Icons.houseboat),
    NavItem('Workout', Icons.fitness_center),
    NavItem('My Fit', Icons.account_circle)
  ];
  int _selectedIndex = 0;
  late List<BottomNavigationBarItem> navBarItems;

  @override
  void initState() {
    super.initState();
    pages = [
      const HomePage(),
      const CoursePage(),
      const WorkoutPage(),
      const MyPage(),
      // add page views here
    ];

    navBarItems = navItems
        .map((e) =>
            BottomNavigationBarItem(label: e.label, icon: Icon(e.iconData)))
        .toList();
  }

  Widget _getPageViewWidget(int _index) {
    return Offstage( // prevent disordering
        offstage: _selectedIndex != _index,
        child: TickerMode(
          enabled: _selectedIndex == _index,
          child: pages[_index],
        ));
  }

  @override
  void didUpdateWidget(ContainerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('update container widget');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [0,1,2,3].map((e) => _getPageViewWidget(e)).toList(),
        // children: [
        //   _getPageViewWidget(0),
        //   _getPageViewWidget(1),
        //   _getPageViewWidget(2),
        //   _getPageViewWidget(3),
        //   // add pages here
        // ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: navBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo[500],
        onTap: (int index) {
          if (_selectedIndex != index) {
            setState(() {
              print(_selectedIndex);
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }
}
