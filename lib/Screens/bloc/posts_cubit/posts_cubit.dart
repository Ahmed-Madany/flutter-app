import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/models/posts_Model.dart';
import 'package:myapp/service/post_service.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial()) {
    getPostData(); 
  }

  List<PostModle> posts = [];

  void getPostData() async {
    try {
      emit(PostsLoading());
      posts = await PostService().getPost();
      emit(PostsSuccess());
    } catch (e) {
      emit(PostsError());
    }
  }
}
