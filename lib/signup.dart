import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'login.dart';
import 'user.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confpassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscured = true;
  bool _isObscured2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
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
                  const SizedBox(height: 50.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _fname,
                            autofocus: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              labelText: 'First Name',
                              contentPadding: const EdgeInsets.fromLTRB(
                                  20.0, 15.0, 20.0, 15.0),
                            ),
                            validator: (value) {
                              // check if the input text is valid
                              if (value == null || value.isEmpty) {
                                return 'Field cannot be left empty';
                              } else if (!isValidName(value)) {
                                return 'Please provide a valid username';
                              }
                              return null;
                            },
                          ),
                        ],
                      )),
                      const SizedBox(width: 20.0),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _lname,
                            autofocus: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              labelText: 'Last Name',
                              contentPadding: const EdgeInsets.fromLTRB(
                                  20.0, 15.0, 20.0, 15.0),
                            ),
                            validator: (value) {
                              // check if the input text is valid
                              if (value == null || value.isEmpty) {
                                return 'Field cannot be left empty';
                              } else if (!isValidName(value)) {
                                return 'Please provide a valid username';
                              }
                              return null;
                            },
                          ),
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _username,
                    autofocus: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      labelText: 'Enter Username',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
                  TextFormField(
                    controller: _confpassword,
                    autofocus: false,
                    obscureText: _isObscured2,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        labelText: 'Confirm Password',
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        suffixIcon: IconButton(
                          // if you want to reveal the password, click the suffix icon;
                          // icon changes depending on the value of _isObscured
                          icon: Icon(
                            _isObscured2
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscured2 = !_isObscured2;
                            });
                          },
                        )),
                    validator: (value) {
                      // check if the input text is valid
                      if (value == null || value.isEmpty) {
                        return 'Field cannot be left empty';
                      } else if (!isValidPassword(value)) {
                        return 'Minimum of 8 characters';
                      } else if (value != _password.text) {
                        return 'Passwords do not match'; // check if password and confirm password match
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
                      child: const Text('Sign Up'),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await addData(_fname.text, _lname.text,
                              _username.text, _password.text);

                          if (!mounted) {
                            return;
                          }
                          Navigator.pop(context);
                        }
                      }),
                ])),
      )),
    );
  }
}

// function to check if the input name is valid
bool isValidName(String? value) {
  RegExp regex = RegExp(r'^([A-Z][-,a-z. ]+[ ]*)+$');
  if (!regex.hasMatch(value!)) {
    return false;
  }
  return true;
}

// POST - function to register the user
Future<User> addData(
    String fname, String lname, String username, String password) async {
  var response = await http.post(
      Uri.parse('https://cmsc-23-2022-bfv6gozoca-as.a.run.app/api/user'),
      headers: <String, String>{
        'accept': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer Zxi!!YbZ4R9GmJJ!h5tJ9E5mghwo4mpBs@*!BLoT6MFLHdMfUA%',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "username": username,
        "password": password,
        "firstName": fname,
        "lastName": lname,
      }));

  print(response.body);
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to add task');
  }
}
