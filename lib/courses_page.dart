import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page.dart';
import 'course_data.dart';
import 'main.dart';
import 'dart:ui' as ui;

class CoursesPage extends StatelessWidget {
  final String title;
  CoursesPage({super.key, required this.title});


  @override
  Widget build(BuildContext context) {
    final ButtonStyle navLinkStyle = TextButton.styleFrom(
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      textStyle: const TextStyle(fontSize: 15),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
    ).copyWith(
      overlayColor: WidgetStateProperty.all(const Color(0xFFE3D5E8)),
      foregroundColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
          if (states.contains(WidgetState.hovered)) {
            return Theme.of(context).primaryColor;
          }
          return Colors.black;
        },
      ),
    );

    final course = courseData.firstWhere(
          (c) => c.title == title,
      orElse: () => Course(title: '', description: '', chaps: {}),
    );

    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: (hei * 0.85 > wid)?true:false,
        backgroundColor: appbgcol,
        foregroundColor: Colors.black,
        elevation: 1.0,
        toolbarHeight: 70,
        title: Row(children: [
          if(kIsWeb || !Platform.isAndroid)
            SizedBox(height: 70, width: 70, child: IconButton(onPressed: () => Navigator.pushNamed(context, '/'), icon: Image.asset("images/icon1.png"))),
          const SizedBox(width: 5),
          const Text('Course Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        ]),
        actions: (hei<wid*0.9)?<Widget>[
          TextButton(
          onPressed: () => Navigator.pushNamed(context, '/'),
          style: navLinkStyle,
          child: const Text('Home'),
        ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/material'),
            style: navLinkStyle,
            child: const Text('Study Material / Tests'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/reviews'),
            style: navLinkStyle,
            child: const Text('Reviews'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/about'),
            style: navLinkStyle,
            child: const Text('About Me'),
          ),
          const SizedBox(width: 10),
          OutlinedButton(
            onPressed: () => Navigator.pushNamed(context, '/contact'),
            child: const Text('Contact'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.black),
            ).copyWith(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.hovered)) return Colors.grey.shade100;
                return null;
              }),
            ),
          ),
          const SizedBox(width: 10),
          // ElevatedButton(
          //   onPressed: () => Navigator.pushNamed(context, '/login'),
          //   child: const Text('Sign Up'),
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.black,
          //     foregroundColor: Colors.white,
          //   ).copyWith(
          //     backgroundColor: WidgetStateProperty.resolveWith((states) {
          //       if (states.contains(WidgetState.hovered)) return Colors.grey.shade800;
          //       return Colors.black;
          //     }),
          //   ),
          // ),
          const SizedBox(width: 20),
        ]:<Widget>[SizedBox.shrink()],
      ),
      drawer: (hei * 0.85 > wid)
          ? Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('PTS Chemistry Class', style: TextStyle(fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () => Navigator.pushNamed(context, '/'),
            ),
            ListTile(
              leading: const Icon(Icons.book_outlined),
              title: const Text('Study Materials'),
              onTap: () => Navigator.pushNamed(context, '/material'),
            ),
            ListTile(
              leading: const Icon(Icons.reviews_outlined),
              title: const Text('Reviews'),
              onTap: () => Navigator.pushNamed(context, '/reviews'),
            ),
            ListTile(
              leading: const Icon(Icons.account_box_outlined),
              title: const Text('About Me'),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            ListTile(
              leading: const Icon(Icons.quick_contacts_dialer_outlined),
              title: const Text('Contact'),
              onTap: () => Navigator.pushNamed(context, '/contact'),
            ),
            // ListTile(
            //   leading: const Icon(Icons.settings),
            //   title: const Text('Sign Up'),
            //   onTap: () => Navigator.pushNamed(context, '/login'),
            // ),
          ],
        ),
      )
          : null,

      backgroundColor: bgcol,
      body:
          SingleChildScrollView(child:
      Column(children: [
        Center(child:
        Text(title,style: TextStyle(fontSize: 28),),),
        SizedBox(height: 20,),
        Text(courseData.firstWhere((course) => course.title == title).description, style: TextStyle(fontSize: 20),),
        SizedBox(height: 15,),
        Text("Chapters (Click below)",style: TextStyle(fontSize: 20),),
        SizedBox(height: 15,),

    if ((course.chaps.isNotEmpty && course.chaps.keys.any((k) => k.isNotEmpty)))
    ...course.chaps.entries.map((chapterEntry) => ExpansionTile(
    title: Text(
    chapterEntry.key.isNotEmpty ? chapterEntry.key : 'Untitled Chapter'
    ),
    children: [
    if (chapterEntry.value.isNotEmpty)
    ...chapterEntry.value.map((link) => ListTile(
    title: InkWell(
    child: Text(
    link,
    style: TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline
    ),
    ),
    onTap: () async {
    final uri = Uri.parse(link.substring(link.indexOf("http")));

      if (!await launchUrl(uri)) {
        //print("cant open");
      };
    },
    ),
    ))
    else
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text("No links for this chapter"),
    )
    ],
    ))
    else
    Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text("No chapters found for this course."),
    ),
    SizedBox(height: 15,),
      ]),),
    );
  }
}
