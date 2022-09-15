import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';
import '../widgets/button.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({Key? key}) : super(key: key);

  @override
  State<LogoutScreen> createState() => LogoutScreenState();
}

class LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: <Widget>[
            CustomButton(
              text: "Logout",
              onpress: () {
                BlocProvider.of<LoginBloc>(context).applySignIn();
              },
            )
          ],
        ),
        body: Stack(fit: StackFit.expand, children: <Widget>[
          const Image(
            image: AssetImage('assets/images/flutterimg.jpg'),
            color: Colors.black87,
            colorBlendMode: BlendMode.plus,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const Text(
                "Home Screen",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 80.0,
              ),
            ],
          )
        ]));
  }
}
