import 'package:flutter/material.dart';
import 'navbar.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({Key? key}) : super(key: key);

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Following'),
        ),
        drawer: const NavBar(),
        body: const Center(child: Text('Following')));
  }
}
