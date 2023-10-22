import 'package:flutter/material.dart';
import 'package:reminiscence_therapy_app/models/topic_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reminiscence_therapy_app/services/topic_service.dart';

class ViewImage extends StatefulWidget {
  const ViewImage({super.key});

  @override
  State<ViewImage> createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    final Topic topic = ModalRoute
        .of(context)!
        .settings
        .arguments as Topic;

    final List<String> imageUrls = topic.images;
    // topic service
    final TopicService topicService = TopicService();

    // Image container - widget
    Widget imageContainer(String imageUrl) {
      return Container(
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(12.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          // Apply the same radius here
          child: Image.network(
            imageUrl,
            width: 200,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    // buttons for choose image source - widget
    Widget uploadImageButtons() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text('Camera'),
            onTap: () {
              topicService.getUploadedImage(ImageSource.camera);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Gallery'),
            onTap: () async {
              topicService.getUploadedImage(ImageSource.gallery);
              Navigator.pop(context);
            },
          )
        ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return uploadImageButtons();
              });
        },
        tooltip: 'Upload Image',
        backgroundColor: Colors.blue[900],
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
