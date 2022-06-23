import 'package:flutter/material.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Workout"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: _getWorkoutView(context),
          ),
        ));
  }

  List<MyCard> entries = <MyCard>[
    MyCard('title', 'imagePath', 'description'),
    MyCard('title', 'imagePath', 'description'),
    MyCard('title', 'imagePath', 'description'),
    MyCard('title', 'imagePath', 'description'),
    MyCard('title', 'imagePath', 'description')
  ];
  // final List<String> entries = <String>['A', 'B', 'C'];

  Widget _getWorkoutView(BuildContext context){
    return ListView.builder(
      padding: const EdgeInsets.only(left: 8, right: 8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 150,
          child: entries[index],
        );
      },
      // separatorBuilder: (BuildContext context, int index) => const Divider(),
    );

  }

  // Wiget _getCard(){
  //   String title;
  //   String
  //
  // }
}

class MyCard extends StatelessWidget {
  String title, imagePath, description;

  MyCard(this.title, this.imagePath, this.description, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: SizedBox(
            width: 600,
            height: 150,
            child: Column(
              children: [
                Text(title),
                Text(description)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

