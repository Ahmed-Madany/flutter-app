import 'package:dio/dio.dart';
import 'package:myapp/models/posts_Model.dart';

class PostService {
  String getPostEndpoint = "https://jsonplaceholder.typicode.com/posts";
  final dio = Dio();
  Future<List<PostModle>> getPost() async {
    List<PostModle> posts = [];
    final response = await dio.get(getPostEndpoint,);
    var data = response.data;
    data.forEach((elmet) {
      posts.add(PostModle.fromJson(elmet));  
    }) ;
    return posts;

  }
}
