import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reminiscence_therapy_app/screens/choose_topic_screen.dart';
import 'package:reminiscence_therapy_app/screens/home_screen.dart';
import 'package:reminiscence_therapy_app/screens/view_images_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: '/choose-topic',
    routes: {
      '/home': (context) => const Home(),
      '/choose-topic': (context) => const ChooseTopic(),
      '/topic-images': (context) => const ViewImage(),
    }
  ));
}