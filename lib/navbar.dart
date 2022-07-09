import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';
import 'following.dart';
import 'settings.dart';
import 'login.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        const SizedBox(height: 20.0),
        Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 10.0),
                ClipOval(
                  child: Image.asset(
                    'assets/images/blank.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Sean Ross Mapue',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            )),
        const SizedBox(height: 20.0),
        ListView(
          shrinkWrap: true,
          children: <Widget>[
            ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                }),
            ListTile(
                leading: const Icon(Icons.verified_user),
                title: const Text('My Profile'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                }),
            ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Following'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FollowingPage()));
                }),
            ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()));
                }),
            ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                }),
          ],
        ),
      ],
    ));
  }
}
