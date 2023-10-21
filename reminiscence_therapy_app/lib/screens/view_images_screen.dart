import 'package:flutter/material.dart';
import 'package:reminiscence_therapy_app/models/topic_model.dart';

class ViewImage extends StatefulWidget {
  const ViewImage({super.key});

  @override
  State<ViewImage> createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {

  @override
  Widget build(BuildContext context) {

    final Topic topic = ModalRoute.of(context)!.settings.arguments as Topic;

    final List<String> imageUrls = topic.images;

    // Image container widget
    Widget imageContainer(String imageUrl) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0), // Apply the same radius here
          child: Image.network(
            imageUrl,
            width: 200,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(topic.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return imageContainer(imageUrls[index]);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16.0);
          },
        ),
      ),
    );
  }
}
