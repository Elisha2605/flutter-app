import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Home'),
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
          child: const Text('Reminscence Therapy'),
        ),
      ),
    );
  }
}
