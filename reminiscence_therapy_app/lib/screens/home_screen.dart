import 'package:flutter/material.dart';
import 'package:reminiscence_therapy_app/screens/choose_topic_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _ViewImageState();
}

class _ViewImageState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Home'),
      ),
      body: Center(
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseTopic()));
            Navigator.pushNamed(context, '/choose-topic');
          },
          child: Text('Reminscence Therapy'),
        ),
      ),
    );
  }
}
