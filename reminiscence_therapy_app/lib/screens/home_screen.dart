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
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24), // Add padding
            textStyle: const TextStyle(
              fontSize: 16, // Adjust font size
              fontWeight: FontWeight.bold, // Adjust font weight
            ),
            backgroundColor: Colors.blue[900],
          ),
          child: const Text('Go To Reminiscence Therapy'),
          onPressed: () => Navigator.pushNamed(context, '/choose-topic'),
        ),
      ),
    );
  }
}
