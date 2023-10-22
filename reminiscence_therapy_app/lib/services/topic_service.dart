import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reminiscence_therapy_app/models/topic_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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

  Future<void> getUploadedImage(ImageSource source) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        print(File(pickedFile.path));
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
}





