import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reminiscence_therapy_app/models/topic_model.dart';

class TopicService {
  Future<List<Topic>> fetchTopics() async {
    try {
      final QuerySnapshot topicSnapshot =
      await FirebaseFirestore.instance.collection('topics').get();

      final topics = topicSnapshot.docs
          .map((document) => Topic.fromDocument(document))
          .toList();

      return topics;
    } catch (e) {
      print('Error in fetchTopics: $e');
      return [];
    }
  }
}





