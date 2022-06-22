import 'package:GoFit/pages/home_page.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({Key? key}) : super(key: key);

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  // todo: container -> home page knows the user login state

  late List<Widget> pages; // container page views
  // Navigation bar
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
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

  @override
  void initState() {
    super.initState();
    print("init state of container");
    pages = [
        const HomePage(),
        // add page views here
      ];
  }

  Widget _getPageViewWidget(int _index) {
    return Offstage(
      offstage: _selectedIndex != _index,
      child: TickerMode(
        enabled: _selectedIndex == _index,
        child: pages[_index],
      ),
    );
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
            print(_selectedIndex);
          });
        },
      ),
    );
  }
}
