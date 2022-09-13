// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:form_field_validator/form_field_validator.dart';

import '../bloc/login_bloc.dart';
import '../widgets/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validatepass(value) {
    if (value!.isEmpty) {
      return "Required";
    } else if (value.length < 6) {
      return "Should be At least 6 character";
    } else if (value.length > 6) {
      return "Should Not be more than 15 character";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(fit: StackFit.expand, children: <Widget>[
          Image(
            image: AssetImage('assets/images/flutterimg.jpg'),
            color: Colors.black87,
            colorBlendMode: BlendMode.plus,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Log-In",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Form(
                autovalidateMode: AutovalidateMode.always,
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Email Address",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.all(10.0),
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Email",
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required*"),
                            EmailValidator(errorText: "Not a Valid Email"),
                          ])),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.all(10.0),
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Password",
                        ),
                        validator: validatepass,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              CustomButton(
                  text: "Login",
                  onpress: () {
                    BlocProvider.of<LoginBloc>(context).applyLogout();
                  })
            ],
          )
        ]));
  }
}
