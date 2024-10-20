import 'package:flutter/material.dart';

class Just extends StatefulWidget {
  const Just({super.key});

  @override
  State<Just> createState() => _JustState();
}

class _JustState extends State<Just> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Hello")
          ],
        ),
      ),
    );
  }
}