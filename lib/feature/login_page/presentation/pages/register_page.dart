import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:form_field_validator/form_field_validator.dart';

import '../bloc/login_bloc.dart';
import '../widgets/button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? validatepass(value) {
    if (value!.isEmpty) {
      return "Required*";
    } else if (value.length < 6) {
      return "Should be At least 6 character";
    } else if (value.length > 6) {
      return "Should Not be more than 15 character";
    } else {
      return null;
    }
  }

  String? validateAge(value) {
    if (value!.isEmpty) {
      return "Required*";
    } else if (value.length < 1) {
      return "Should be At least 1 character";
    } else if (value.length > 3) {
      return "Should Not be more than 3 character";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(fit: StackFit.expand, children: <Widget>[
          const Image(
            image: AssetImage('assets/images/flutterimg.jpg'),
            color: Colors.black87,
            colorBlendMode: BlendMode.plus,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
            reverse: false,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ignore: prefer_const_constructors
                Text(
                  "REGISTER",
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        // ignore: prefer_const_constructors
                        child: Text(
                          "Name",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)),
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Name",
                          ),
                          validator: RequiredValidator(errorText: "Required*"),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),

                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Age",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)),
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Age",
                          ),
                          validator: validateAge,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: const Text(
                          "Email Address",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      const SizedBox(
                        height: 1.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)),
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.all(10.0),
                        child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Email",
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required*"),
                              EmailValidator(errorText: "Not a Valid Email"),
                            ])),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        // ignore: prefer_const_constructors
                        child: Text(
                          "Password",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      const SizedBox(
                        height: 1.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)),
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          obscureText: true,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Password",
                          ),
                          validator: validatepass,
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                    ],
                  ),
                ),
                CustomButton(
                    text: "Register",
                    onpress: () {
                      BlocProvider.of<LoginBloc>(context).applySignIn();
                    })
              ],
            ),
          ),
        ]));
  }
}
