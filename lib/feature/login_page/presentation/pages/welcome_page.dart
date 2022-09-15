import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../widgets/button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "WELCOME!",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          const SizedBox(
            height: 400.0,
          ),
          CustomButton(
              text: "Get Started",
              onpress: () {
                BlocProvider.of<LoginBloc>(context).applyRegister();
              })
        ],
      )
    ]));
  }
}
