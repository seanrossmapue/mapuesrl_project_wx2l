import 'package:flutter/material.dart';
import 'navbar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: const NavBar(),
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 20.0,
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Account Information'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Privacy and Security'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language and Region'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.block),
              title: const Text('Blocking'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text('Download your Information'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.policy),
              title: const Text('Terms and Policy'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {},
            ),
          ],
        ));
  }
}
