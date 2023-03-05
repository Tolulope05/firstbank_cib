import 'package:flutter/material.dart';

class Logincreen extends StatefulWidget {
  Logincreen({Key? key}) : super(key: key);

  @override
  State<Logincreen> createState() => _LogincreenState();
}

class _LogincreenState extends State<Logincreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Login Screen")),
    );
  }
}
