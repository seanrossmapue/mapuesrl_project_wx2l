import 'package:flutter/material.dart';
import 'navbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
        ),
        drawer: const NavBar(),
        body: Container(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
            child: Column(children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/blank.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(width: 40.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Sean Ross Mapue',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '@seanross',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 50, 50, 50)),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              const Divider(
                thickness: 2,
                color: Color.fromARGB(255, 222, 222, 222),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          minimumSize: const Size.fromHeight(50.0),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                        ),
                        child: const Text('Profile Info'),
                        onPressed: () {}),
                  ),
                  const SizedBox(width: 50.0),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 201, 201, 201),
                          minimumSize: const Size.fromHeight(50.0),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                        ),
                        child: const Text(
                          'Update Profile',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {}),
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              const Divider(
                thickness: 2,
                color: Color.fromARGB(255, 222, 222, 222),
              ),
              const SizedBox(height: 10.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'About',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10.0),
              const Divider(
                thickness: 2,
                color: Color.fromARGB(255, 222, 222, 222),
              ),
              const SizedBox(height: 10.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Following',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10.0),
              const Divider(
                thickness: 2,
                color: Color.fromARGB(255, 222, 222, 222),
              ),
              const SizedBox(height: 10.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Posts',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10.0),
              const Divider(
                thickness: 2,
                color: Color.fromARGB(255, 222, 222, 222),
              ),
              const SizedBox(height: 10.0),
            ])));
  }
}
