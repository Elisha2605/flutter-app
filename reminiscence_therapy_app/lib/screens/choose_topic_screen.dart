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

  // dummy data

  /*List<Topic> topics = [
    Topic(name: 'My childhood', images: [
      'https://images.unsplash.com/photo-1579763863374-132c0184f2aa?w=300',
      'https://images.unsplash.com/photo-1544632522-23a3a265c321?w=300ﬁ'
    ]),
    Topic(name: 'Food', images: [
      'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=300',
      'https://images.unsplash.com/photo-1518843875459-f738682238a6?w=300'
    ]),
    Topic(name: 'Art', images: [
      'https://images.unsplash.com/photo-1545989253-02cc26577f88?w=300',
      'https://images.unsplash.com/flagged/photo-1572392640988-ba48d1a74457?w=300',
      'https://images.unsplash.com/photo-1536924940846-227afb31e2a5?w=300'
    ]),
    Topic(name: 'Household', images: [
      'https://images.unsplash.com/photo-1610527003928-47afd5f470c6?w=300'
    ]),
  ];*/

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
          onTap: ()  => navigateToImages(index),
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
