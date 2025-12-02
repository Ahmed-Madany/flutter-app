import 'package:flutter/material.dart';
import 'package:myapp/models/posts_Model.dart';

class PostsDetailsScreen extends StatefulWidget {
  final PostModle postDetails;
  const PostsDetailsScreen({super.key, required this.postDetails});

  @override
  State<PostsDetailsScreen> createState() => _PostsDetailsScreenState();
}

class _PostsDetailsScreenState extends State<PostsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Details Screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(child: Text(widget.postDetails.body)),
    );
  }
}
