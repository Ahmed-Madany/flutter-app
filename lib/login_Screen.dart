
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:myapp/Screens/home_screen.dart';
import 'package:myapp/Widget/custom_textfild.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Login screen"),
      ),
      body: Column(
        children: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Login screen"),
        ),
        Padding(padding: const EdgeInsets.all(8.0),child:CustomTextField(lableText: "Email"),),
        CustomTextField(lableText: "Password"),ElevatedButton(onPressed: (){
       Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (context) => const HomeScreen(),
    ),
  );
        }, child: Text("Login"))],
      ),
    );
  }
}
