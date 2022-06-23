import 'package:GoFit/pages/video_player.dart';
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
    MyCard(
      '30-Minute HIIT Cardio Workout with Warm Up',
      'https://i.ytimg.com/vi/ml6cT4AZdqI/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLC2Yakf4nieopGux521AsbN50n9ig',
      'In this high intensity cardio bodyweight workout from trainer Lita Lewis, you’ll spike your heart rate with high-knees, fast feet, and star jumps; plus work your core and lower body with jumping lunges and planks - at home! No equipment needed!',
      videoLink: "https://www.youtube.com/watch?v=ml6cT4AZdqI",
    ),
    MyCard(
        '20 Minute Full Body Cardio HIIT Workout [NO REPEAT]',
        'https://i.ytimg.com/vi/M0uO8X3_tEA/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBJHzrJ8QFcwKzc_piA8hLNBuKyCQ',
        'Tap in with us for a fun 20 Minute high intensity cardio ',
        videoLink: "https://www.youtube.com/watch?v=UoC_O3HzsH0"),
    MyCard(
      '20 MIN FULL BODY WORKOUT - Beginner Version',
      'https://i.ytimg.com/vi/UItWltVZZmE/hq720.jpg?sqp=-oaymwEcCOgCEMoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLC2IOku2W6tFO9esp56wSq9-xPIWQ',
      ' // No Equipment I Pamela Reif',
      videoLink: "https://www.youtube.com/watch?v=UItWltVZZmE",
    ),
  ];

  // final List<String> entries = <String>['A', 'B', 'C'];

  Widget _getWorkoutView(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 8, right: 8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          // height: 150,
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
  String title, imagePath, description, videoLink;

  MyCard(this.title, this.imagePath, this.description,
      {this.videoLink = "", Key? key})
      : super(key: key);

  openVideo(BuildContext context, String title, String videoLink) {
    print("open video");
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return VideoPlayerPage(
        title,
        videoLink,
        description: description,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
            openVideo(context, title, videoLink);
          },
          child: SizedBox(
            width: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  imagePath,
                  fit: BoxFit.fill,
                  // height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        Divider(
                          color: Colors.white,
                          height: 5,
                        ),
                        Text(description)
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
