import 'package:flutter/material.dart';
import 'home_page.dart';
import 'course_data.dart';

class CoursesPage extends StatelessWidget {
  final String title;
  CoursesPage({super.key, required this.title});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses Details', style: TextStyle(fontSize: 25),),
      ),
      body: Column(children: [
        Center(child:
        Text(title,style: TextStyle(fontSize: 28),),),
        SizedBox(height: 20,),
        Text(courseData.firstWhere((course) => course.title == title).description, style: TextStyle(fontSize: 20),),
        SizedBox(height: 15,),
        Text("Time: " + courseData.firstWhere((course) => course.title == title).timings, style: TextStyle(fontSize: 20),),
        SizedBox(height: 15,),
        Text("Price: " + courseData.firstWhere((course) => course.title == title).price, style: TextStyle(fontSize: 20),),
        SizedBox(height: 15,),
      ]),
    );
  }
}
