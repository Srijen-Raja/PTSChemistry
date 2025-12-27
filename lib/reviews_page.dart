import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';
import 'dart:ui' as ui;

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  bool isReview = false;
  int _starRating = 0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle navLinkStyle = TextButton.styleFrom(
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      textStyle: const TextStyle(fontSize: 15),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14))),
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
        automaticallyImplyLeading: (hei * 0.85 > wid),
        backgroundColor: appbgcol,
        foregroundColor: Colors.black,
        elevation: 1.0,
        toolbarHeight: 70,
        title: Row(
          children: [
            if(kIsWeb || !Platform.isAndroid)
            SizedBox(
              height: 70,
              width: 70,
              child: IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/'),
                  icon: Image.asset("images/icon1.png")),
            ),
            const SizedBox(width: 5),
            const Text('Reviews', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ],
        ),
        actions: (hei < wid * 0.9)
            ? <Widget>[
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            style: navLinkStyle,
            child: const Text('Home'),
          ),
          // TextButton(
          //   onPressed: () => Navigator.pushNamed(context, '/material'),
          //   style: navLinkStyle,
          //   child: const Text('Study Material / Tests'),
          // ),
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
                if (states.contains(WidgetState.hovered)) {
                  return Colors.grey.shade100;
                }
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
          //     backgroundColor: MaterialStateProperty.resolveWith((states) {
          //       if (states.contains(MaterialState.hovered)) {
          //         return Colors.grey.shade800;
          //       }
          //       return Colors.black;
          //     }),
          //   ),
          // ),
          const SizedBox(width: 20),
        ]
            : <Widget>[SizedBox.shrink()],
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
            // ListTile(
            //   leading: const Icon(Icons.book_outlined),
            //   title: const Text('Study Materials'),
            //   onTap: () => Navigator.pushNamed(context, '/material'),
            // ),
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
      body: isReview
          ? writeReview(context)
          : Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _reviewController.clear();
                    _nameController.clear();
                    _starRating = 0;
                    isReview = true;
                  });
                },
                backgroundColor: const Color(0xFF91CC8F),
                child: const Text("Write a Review"),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: (wid < hei)
                  ? ListView(
                children: [
                    Image.asset(
                      "images/achi.jpg",
                      fit: BoxFit.cover,
                    ),
                  const SizedBox(height: 10),
                  _buildReviewsListWidget(),
                ],
              )
                  : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: wid * 0.3,
                    child: Image.asset("images/achi.jpg"),
                  ),
                  const SizedBox(width: 5),
                  Expanded(child: buildReviewsList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // For phone layout: the StreamBuilder must return a Widget (not a List<Widget>)
  Widget _buildReviewsListWidget() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('reviews')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final docs = snapshot.data!.docs;
        if (docs.isEmpty) {
          return const Center(child: Text('No reviews found.'));
        }
        return Column(
          children: docs.map((doc) {
            final data = doc.data()! as Map<String, dynamic>;
            return ReviewCard(
              studentName: data['name'] ?? 'Unknown',
              reviewText: data['review'] ?? '',
              rating: data['rating'] ?? 0,
            );
          }).toList(),
        );
      },
    );
  }

  // For wide screens, keep the classic scrollable view
  Widget buildReviewsList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('reviews')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final docs = snapshot.data!.docs;
        if (docs.isEmpty) {
          return const Center(child: Text('No reviews found.'));
        }
        return ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: docs.map((doc) {
            final data = doc.data()! as Map<String, dynamic>;
            return ReviewCard(
              studentName: data['name'] ?? 'Unknown',
              reviewText: data['review'] ?? '',
              rating: data['rating'] ?? 0,
            );
          }).toList(),
        );
      },
    );
  }

  Widget writeReview(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        color: const Color(0xFFD1ABE8),
        elevation: 8.0,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Write a Review',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _reviewController,
                maxLines: 8,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  hintText: 'Type your review here, include your grade, year, current position, and reviews about the class and experience.',
                ),
              ),
              const SizedBox(height: 10),
              // Star rating row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _starRating ? Icons.star : Icons.star_border,
                      color: const Color(0xFFFFD400),
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        _starRating = index + 1;
                      });
                    },
                    splashRadius: 24,
                  );
                }),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _nameController,
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  hintText: 'Enter your Name.',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isReview = false;
                      });
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF78D371)),
                    onPressed: () async {
                      if (_starRating == 0 ||
                          _nameController.text.isEmpty ||
                          _reviewController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill all the fields')),
                        );
                        return;
                      }
                      try {
                        await FirebaseFirestore.instance.collection('reviews').add({
                          'name': _nameController.text.trim(),
                          'review': _reviewController.text.trim(),
                          'rating': _starRating,
                          'timestamp': FieldValue.serverTimestamp(),
                        });
                        setState(() {
                          isReview = false;
                          _starRating = 0;
                          _nameController.clear();
                          _reviewController.clear();
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Review submitted successfully')),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to submit review: $e')),
                        );
                      }
                    },
                    child: const Text('Submit', style: TextStyle(color: Colors.black)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String studentName;
  final String reviewText;
  final int rating;

  const ReviewCard({
    super.key,
    required this.studentName,
    required this.reviewText,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFD9B7E8),
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: const Color(0xFFFFD400),
                  size: 30,
                );
              }),
            ),
            const SizedBox(height: 8),
            Text(
              '"$reviewText"',
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '- $studentName',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
