import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/view/widget/glitch.dart';
import 'package:tiktok_clone/view/widget/text_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 80),
          child: Column(
            children: [
              GlithEffect(
                child: const Text(
                  "Welcome to TeachVideo",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  GestureDetector(
                    onTap: (){
                      AuthController.instance.pickImage();
                    },
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage("https://i.pinimg.com/474x/57/00/c0/5700c04197ee9a4372a35ef16eb78f4e.jpg"),
                    ),
                  ),
                  Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                      child: Icon(Icons.edit,size: 20,color: backgroundColor,)
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextInputField(
                controller: _userName,
                icon: Icons.person,
                labelText: "User Name",
              ),
              const SizedBox(
                height: 10,
              ),
              TextInputField(
                controller: _email,
                icon: Icons.email,
                labelText: "Email",
              ),
              const SizedBox(
                height: 10,
              ),
              TextInputField(
                controller: _password,
                icon: Icons.password,
                labelText: "Password",
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              TextInputField(
                controller: _confirmPassword,
                icon: Icons.password,
                labelText: "Confirm Password",
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: (){
                  AuthController.instance.SignUp(
                      _userName.text,
                      _email.text,
                      _password.text,
                      AuthController.instance.proImage,
                  );
                },
                child: const Text("SignUp"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
