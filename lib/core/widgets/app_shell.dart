import 'package:flutter/material.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AppShell')),
      body: Center(child: Text('Hello from AppShell')),
    );
  }
}
