// three_page.dart
import 'package:flutter/material.dart';

class ThreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Three'),
      ),
      body: const Center(
        child: Text('This is Page Three'),
      ),
    );
  }
}
