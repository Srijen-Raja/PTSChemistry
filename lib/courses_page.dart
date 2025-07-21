import 'package:flutter/material.dart';
import 'home_page.dart'; // Import home_page.dart to get access to the shared content widgets.

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses'),
      ),
      body: const CoursesPageContent(colossal: false),
    );
  }
}
