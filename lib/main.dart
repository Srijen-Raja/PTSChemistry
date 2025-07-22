import 'package:flutter/material.dart';
import 'package:ptschemistryclass/login_page.dart';
import 'home_page.dart';
import 'courses_page.dart';
import 'reviews_page.dart';
import 'about_page.dart';
import 'contact_page.dart';

void main() {
  runApp(const TutorWebsite());
}

class TutorWebsite extends StatelessWidget {
  const TutorWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PTS Chemistry Class',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Georgia',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/reviews': (context) => const ReviewsPage(),
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}