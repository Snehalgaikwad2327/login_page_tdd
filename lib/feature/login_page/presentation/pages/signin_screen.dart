// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/login_bloc.dart';
import '../widgets/button.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  bool _isChecked = false;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  void handleRemeberme(bool? value) {
    _isChecked = value!;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', _emailController.text);
        prefs.setString('password', _passwordController.text);
      },
    );
    setState(() {
      _isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        // ignore: prefer_const_literals_to_create_immutables
        body: Stack(fit: StackFit.expand, children: <Widget>[
          const Image(
            image: AssetImage('assets/images/flutterimg.jpg'),
            color: Colors.black87,
            colorBlendMode: BlendMode.plus,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "SUCCESSFULLY  REGISTERED",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              const SizedBox(
                height: 300.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      activeColor: Colors.black,
                      value: _isChecked,
                      onChanged: handleRemeberme),
                  Text("Remember Me",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomButton(
                  text: "Sign In",
                  onpress: () {
                    BlocProvider.of<LoginBloc>(context)
                        .saveIsRemember(_isChecked);
                    BlocProvider.of<LoginBloc>(context).applyLogIn();
                  })
            ],
          )
        ]));
  }
}
