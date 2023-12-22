import 'package:flutter/material.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/view/widget/glitch.dart';
import 'package:tiktok_clone/view/widget/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlithEffect(
            child: const Text(
            "TeachVideo",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextInputField(
            controller: _email,
            icon: Icons.email,
            labelText: "EMail",
          ),
          SizedBox(
            height: 10,
          ),
          TextInputField(
            controller: _password,
            icon: Icons.password,
            labelText: "Password",
            obscureText: true,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: (){
              AuthController.instance.Login(_email.text, _password.text);
            },
            child: Text("Login"),
          )
        ],
      ),
    );
  }
}
