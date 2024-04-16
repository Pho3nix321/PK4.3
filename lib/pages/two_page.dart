// two_page.dart
import 'package:flutter/material.dart';

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Two'),
      ),
      body: const Center(
        child: Text('This is Page Two'),
      ),
    );
  }
}