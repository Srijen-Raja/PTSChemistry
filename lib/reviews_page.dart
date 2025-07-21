import 'package:flutter/material.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Reviews'),
      ),
      body: Stack(children: [
        ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          FloatingActionButton(onPressed: (){},child: Text("Write a Review"),),ReviewCard(
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
