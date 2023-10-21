import 'package:flutter/material.dart';
import 'package:reminiscence_therapy_app/models/topic_model.dart';
import 'package:reminiscence_therapy_app/services/topic_service.dart';

class ChooseTopic extends StatefulWidget {
  const ChooseTopic({super.key});

  @override
  State<ChooseTopic> createState() => _ChooseTopicState();
}

class _ChooseTopicState extends State<ChooseTopic> {
  List<Topic> topics = [];

  // topic service
  final TopicService topicService = TopicService();

  void navigateToImages(index) {
    Topic topic = topics[index];
    Navigator.pushNamed(context, '/topic-images', arguments: topic);
  }

  @override
  void initState() {
    super.initState();
    topicService.fetchTopics().then((topicList) {
      setState(() {
        topics = topicList;
      });
    });
  }

  // Topic List widget
  Widget buildTopicList(Topic topic, index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
      child: Card(
        child: ListTile(
          onTap: () {
            navigateToImages(index);
          },
          title: Text(topic.name),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a topic'),
      ),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          Topic topic = topics[index];
          return buildTopicList(topic, index);
        },
      ),
    );
  }
}
