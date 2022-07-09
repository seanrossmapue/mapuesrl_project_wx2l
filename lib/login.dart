import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'signup.dart';
import 'home.dart';
import 'user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(40.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  const Center(
                    child: Text(
                      'InstaFaceTweet',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                  ),
                  const SizedBox(height: 60.0),
                  TextFormField(
                    controller: _username,
                    autofocus: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      labelText: 'Enter Username',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      prefixIcon: const Icon(Icons.email,
                          color: Color.fromRGBO(50, 62, 72, 1.0)),
                    ),
                    validator: (value) {
                      // check if the input text is valid
                      if (value == null || value.isEmpty) {
                        return 'Field cannot be left empty';
                      } else if (!isValidUsername(value)) {
                        return 'Please provide a valid username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _password,
                    autofocus: false,
                    obscureText: _isObscured,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        labelText: 'Enter Password',
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        prefixIcon: const Icon(Icons.lock,
                            color: Color.fromRGBO(50, 62, 72, 1.0)),
                        suffixIcon: IconButton(
                          // if you want to reveal the password, click the suffix icon;
                          // icon changes depending on the value of _isObscured
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                        )),
                    validator: (value) {
                      // check if the input text is valid
                      if (value == null || value.isEmpty) {
                        return 'Field cannot be left empty';
                      } else if (!isValidPassword(value)) {
                        return 'Minimum of 8 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50.0),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                      child: const Text('Log In'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        }
                      }),
                  const SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        onPressed: () {},
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: TextButton(
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()));
                          },
                        ),
                      )
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

// function to check if the input username is valid
bool isValidUsername(String? value) {
  RegExp regex = RegExp(r'^(?=[a-zA-Z0-9._]{4,20}$)(?!.*[_.]{2})[^_.].*[^_.]$');
  if (!regex.hasMatch(value!)) {
    return false;
  }
  return true;
}

// function to check if the input password is valid
bool isValidPassword(String? value) {
  RegExp regex = RegExp(r'^.{8,}$');
  if (!regex.hasMatch(value!)) {
    return false;
  }
  return true;
}

// Reference:
// https://github.com/saiful86/FlutterTutorials/tree/main/flutter_login_regis_provider
