import 'package:flutter/material.dart';

class UsersHomePage extends StatefulWidget {
  const UsersHomePage({required Key key}) : super(key: key);

  @override
  _UsersHomePageState createState() => _UsersHomePageState();
}

class _UsersHomePageState extends State<UsersHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page User')),
      body: const Center(child: Text('Dummy for this')),
    );
  }
}
