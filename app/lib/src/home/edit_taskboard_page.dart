import 'package:flutter/material.dart';

class EditTaskboardPage extends StatefulWidget {
  const EditTaskboardPage({super.key});

  @override
  State<EditTaskboardPage> createState() => _EditTaskboardPageState();
}

class _EditTaskboardPageState extends State<EditTaskboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LISTINHA'),
      ),
    );
  }
}
