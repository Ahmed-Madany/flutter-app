// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:myapp/Screens/home_screen.dart';
import 'package:myapp/Widget/custom_button.dart';
import 'package:myapp/Widget/custom_textfild.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {


  const SignInScreen({super.key});
  
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPasswordHidden = true;
  final _formkey = GlobalKey<FormState>();
 final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Login screen"),
      ),
      body: Form(
        key:_formkey,
        child: Column(
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
        
                  // SizedBox(
                  //   height: 150,
                  //   width: 150,
                  //   child: Image.network(
                  //     "https://i.pinimg.com/736x/01/78/af/0178af13e6fe792ecd15d2a27583033e.jpg",
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                controller: _emailController,
                lableText: "Email",
                PreFixIcon: Icon(Icons.email),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Email";
                  }
                  return null;
                
                },
              ),
            ),
            CustomTextField(
              controller: _passwordController,
              lableText: "Password",
              PreFixIcon: Icon(Icons.lock),
              isHidden: isPasswordHidden,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  });
                },
                icon: Icon(Icons.remove_red_eye),
              ),
             validator: (value) {
                  if (value!.length < 8) {
                    return "password must be at least 8 characters";
                  }
                  return null;
                },
              ),
            
            MyButton(
              buttonlable: "Login",
              onTap: () async {
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                if (_formkey.currentState!.validate()) {
                  prefs.setString("email", _emailController.text);
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => HomeScreen( email: _emailController.text,),
                    ),
                  );
                } else {
                  // ignore: avoid_print
                  print("Invalid form");
                }
              },
            ),
        
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute<void>(
            //         builder: (context) => const HomeScreen(),
            //       ),
            //     );
            //   },
            //   child: Text("Login"),
            // ),
          ],
        ),
      ),
    );
  }
}
