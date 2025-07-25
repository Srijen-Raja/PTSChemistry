import 'package:flutter/material.dart';

import 'main.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {final ButtonStyle navLinkStyle = TextButton.styleFrom(
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
  var wid = MediaQuery.of(context).size.width;
  var hei = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appbgcol,
        foregroundColor: Colors.black,
        elevation: 1.0,
        toolbarHeight: 70,
        title: Row(children: [
          SizedBox(height: 70, width: 70, child: IconButton(onPressed: () => Navigator.pushNamed(context, '/'), icon: Image.asset("images/icon.jpg"))),
          const SizedBox(width: 5),
          const Text('Reviews', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        ]),
        actions: (hei<wid*0.9)?<Widget>[
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            style: navLinkStyle,
            child: const Text('Home'),
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
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/login'),
            child: const Text('Sign Up'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ).copyWith(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.hovered)) return Colors.grey.shade800;
                return Colors.black;
              }),
            ),
          ),
          const SizedBox(width: 20),
        ]:<Widget>[SizedBox.shrink()],
      ),
      backgroundColor: bgcol,
      drawer: (hei*0.85>wid)?Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('PTS Chemistry Class',style: TextStyle(fontSize: 24),),
            ),ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pushNamed(context, '/'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Reviews'),
              onTap: () => Navigator.pushNamed(context, '/reviews'),
            ),ListTile(
              leading: Icon(Icons.settings),
              title: const Text('About Me'),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Contact'),
              onTap: () => Navigator.pushNamed(context, '/contact'),
            ),ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Sign Up'),
              onTap: () => Navigator.pushNamed(context, '/login'),
            ),
          ],
        ),
      ):null,
      body: Stack(children: [
        ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          FloatingActionButton(onPressed: (){},backgroundColor: Color(0xFF91CC8F),child: Text("Write a Review"),),ReviewCard(
            studentName: 'Priya Sharma',
            reviewText: 'Organic chemistry always seemed impossible, but the way concepts were broken down made it so much easier to understand. I\'m actually enjoying it now!',
          ),
          ReviewCard(
            studentName: 'Ben Carter',
            reviewText: 'The AP Chemistry prep course was a game-changer. I walked into the exam feeling confident and well-prepared. The practice materials were excellent.',
          ),
          ReviewCard(
            studentName: 'Mrs. Davis (Parent)',
            reviewText: 'My son\'s interest in science has grown so much since he started these classes. His grades have improved, and more importantly, his confidence has soared. Thank you!',
          ),
          ReviewCard(
            studentName: 'Fatima Khan',
            reviewText: 'I used to struggle with balancing chemical equations, but the step-by-step methods and patient teaching helped me master it. My test scores show the difference.',
          ),
          ReviewCard(
            studentName: 'Leo Martinez',
            reviewText: 'The personalized attention is what makes these sessions so valuable. I could ask any question without feeling shy and get a clear, detailed explanation every time.',
          ),
          ReviewCard(
            studentName: 'Samantha Chen',
            reviewText: 'The sessions on stoichiometry and thermodynamics were incredibly helpful. Complex topics were made clear and I finally feel like I have a strong foundation in chemistry.',
          ),
          ReviewCard(
            studentName: 'David Lee',
            reviewText: 'Fantastic tutor! The lessons are engaging and the online format is very convenient. My overall understanding of chemistry has improved dramatically.',
          ),
          ReviewCard(
            studentName: 'Chloe Rodriguez',
            reviewText: 'The workshop on lab safety and procedures was surprisingly useful. It gave me a huge advantage in my school\'s practical exams.',
          ),
          ReviewCard(
            studentName: 'Aiden Williams',
            reviewText: 'Starting with the foundations course in 9th grade was the best decision. It made all the advanced topics in 11th and 12th grade much easier to tackle.',
          ),
          ReviewCard(
            studentName: 'Jessica Taylor',
            reviewText: 'An amazing teacher who truly cares about their students\' success. My final grade went from a B to an A+ thanks to these tutoring sessions!',
          ),
        ],
      ),]),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String studentName;
  final String reviewText;

  const ReviewCard({super.key, required this.studentName, required this.reviewText});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFD9B7E8),
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '"${reviewText}"',
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '- ${studentName}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
