import 'package:flutter/material.dart';
import 'package:reminiscence_therapy_app/models/topic.dart';
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
    Topic instance = topics[index];
    Navigator.pushNamed(context, '/topic-images', arguments: {
      'name': instance.name,
      'images': instance.images,
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a topic'),
      ),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          Topic topic = topics[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  // Todo: navigate to images
                  navigateToImages(index);
                },
                title: Text(topic.name),
              ),
            ),
          );
        },
      ),
    );
  }
}
