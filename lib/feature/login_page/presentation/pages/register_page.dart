// ignore_for_file: prefer_final_fields, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_page/feature/login_page/domain/entities/user_details.dart';
import 'package:flutter_login_page/feature/login_page/presentation/pages/validations.dart';

import 'package:form_field_validator/form_field_validator.dart';

import '../bloc/login_bloc.dart';
import '../widgets/button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  String? validateAge(value) {
    if (value!.isEmpty) {
      return "Age is Required*";
    } else if (value.length < 1) {
      return "Should be At least 1 character";
    } else if (value.length > 3) {
      return "Should Not be more than 3 character";
    } else {
      return null;
    }
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _age;
  late String _email;
  late String _password;

  bool _autoValidate = false;

  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
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
                Text(
                  "REGISTER",
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
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
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
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Name",
                          ),
                          validator:
                              RequiredValidator(errorText: "Name is Required*"),
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
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
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
                          autofocus: false,
                          controller: _emailController,
                          validator: validateEmail,
                          onSaved: (value) => _email = value!,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Email",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
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
                          keyboardType: TextInputType.text,
                          controller: _passwordController,
                          validator: validatePassword,
                          onSaved: (value) => _password = value!,
                          obscureText: !_passwordVisible,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Password",
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ))),
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
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<LoginBloc>(context).saveUserDetails(
                            UserDetails(
                                name: _nameController.text,
                                age: int.parse(_ageController.text),
                                emailId: _emailController.text,
                                password: _passwordController.text));

                        BlocProvider.of<LoginBloc>(context).applySignIn();
                      } else {
                        setState(() {
                          _autoValidate = true;
                        });
                      }
                    })
              ],
            ),
          ),
        ]));
  }
}
