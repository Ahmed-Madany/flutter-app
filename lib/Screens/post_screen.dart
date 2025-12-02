import 'package:flutter/material.dart';
import 'package:myapp/Screens/posts_details_screen.dart';
import 'package:myapp/models/posts_Model.dart';
import 'package:myapp/service/post_service.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<PostModle> posts = [];

  void getPostFromServer() async {
    posts = await PostService().getPost();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPostFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: posts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            PostsDetailsScreen(postDetails: posts[index]),
                      ),
                    );
                  },
                  child: ListTile(title: Text(posts[index].title)),
                );
              },
            ),
    );
  }
}
