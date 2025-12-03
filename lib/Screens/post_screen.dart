import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Screens/bloc/posts_cubit/posts_cubit.dart';
import 'package:myapp/Screens/posts_details_screen.dart';


class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit(), 
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Post Screen"),
          backgroundColor: Colors.deepOrange,
        ),

        body: BlocBuilder<PostsCubit, PostsState>(
          builder: (context, state) {
            final cubit = context.read<PostsCubit>();

            if (state is PostsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is PostsError) {
              return const Center(child: Text("Error"));
            }

            if (state is PostsSuccess) {
              return ListView.builder(
                itemCount: cubit.posts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PostsDetailsScreen(
                            postDetails: cubit.posts[index],
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(cubit.posts[index].title),
                    ),
                  );
                },
              );
            }

            return const SizedBox(); 
          },
        ),
      ),
    );
  }
}
