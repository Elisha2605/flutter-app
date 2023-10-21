import 'package:cloud_firestore/cloud_firestore.dart';

class Topic {
  final String name;
  final List<String> images;

  Topic({required this.name, required this.images});

  factory Topic.fromDocument(QueryDocumentSnapshot document) {
    return Topic(
      name: document['name'] as String,
      images: (document['images'] as List).cast<String>(),
    );
  }
}

Future<List<Topic>> getTopics() async {
  final QuerySnapshot topicSnapshot =
  await FirebaseFirestore.instance.collection('topics').get();

  final topics = topicSnapshot.docs
      .map((document) => Topic.fromDocument(document))
      .toList();

  return topics;
}
