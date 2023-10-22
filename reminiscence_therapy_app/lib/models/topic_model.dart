import 'package:cloud_firestore/cloud_firestore.dart';

class Topic {
  String name;
  List<String> images;

  Topic({required this.name, required this.images});

  factory Topic.fromDocument(QueryDocumentSnapshot document) {
    return Topic(
      name: document['name'] as String,
      images: (document['images'] as List).cast<String>(),
    );
  }
}
