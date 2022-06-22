import 'package:GoFit/pages/home_page.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({Key? key}) : super(key: key);

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class navItem {
  String label;
  IconData iconData; // Material IconData
  MaterialColor? backgroundColor;

  navItem(this.label, this.iconData);

  void setColor(MaterialColor color) {
    backgroundColor = color;
  }
}

class _ContainerWidgetState extends State<ContainerWidget> {
  // todo: container -> home page knows the user login state

  late List<Widget> pages; // container page views
  List<navItem> navItems = [
    navItem('Home', Icons.home),
    navItem('Course', Icons.houseboat),
    navItem('Workout', Icons.fitness_center),
    navItem('My Fit', Icons.account_circle)
  ];
  int _selectedIndex = 0;
  late List<BottomNavigationBarItem> navBarItems;

  @override
  void initState() {
    super.initState();
    pages = [
      const HomePage(),
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _getPageViewWidget(0),
          // add pages here
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: navBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo[500],
        onTap: (int index) {
          if (_selectedIndex != index) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }
}
