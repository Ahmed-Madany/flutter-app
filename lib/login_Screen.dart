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
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/icon1.jpg"),
                ),

                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.network(
                    "https://i.pinimg.com/736x/01/78/af/0178af13e6fe792ecd15d2a27583033e.jpg",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(lableText: "Email"),
          ),
          CustomTextField(lableText: "Password"),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
