import 'package:flutter/material.dart';

class ViewImage extends StatefulWidget {
  const ViewImage({super.key});

  @override
  State<ViewImage> createState() => _HomeState();
}

class _HomeState extends State<ViewImage> {

  Map topic = {};

  @override
  Widget build(BuildContext context) {

    final arguments = ModalRoute.of(context)!.settings.arguments;

    if (arguments != null && arguments is Map<dynamic, dynamic>) {
      topic = arguments;
    }

    print(topic['images']);

    final List<String> imageUrls = topic['images'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(topic['name']),
      ),
      body: ListView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Image.network(
            imageUrls[index],
          );
        },
      ),
    );
  }
}
