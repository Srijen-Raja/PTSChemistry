import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  bool isReview = false;
  int _starRating = 0;
  var _nameController = TextEditingController();
  var _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle navLinkStyle = TextButton.styleFrom(
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      textStyle: const TextStyle(fontSize: 15),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14))),
    ).copyWith(
      overlayColor: MaterialStateProperty.all(const Color(0xFFE3D5E8)),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return Theme
                .of(context)
                .primaryColor;
          }
          return Colors.black;
        },
      ),
    );

    var wid = MediaQuery
        .of(context)
        .size
        .width;
    var hei = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: (hei * 0.85 > wid) ? true : false,
        backgroundColor: appbgcol,
        foregroundColor: Colors.black,
        elevation: 1.0,
        toolbarHeight: 70,
        title: Row(children: [
          SizedBox(
            height: 70,
            width: 70,
            child: IconButton(
                onPressed: () => Navigator.pushNamed(context, '/'),
                icon: Image.asset("images/icon1.png")),
          ),
          const SizedBox(width: 5),
          const Text('Reviews',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        ]),
        actions: (hei < wid * 0.9)
            ? <Widget>[
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
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.grey.shade100;
                }
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
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.grey.shade800;
                }
                return Colors.black;
              }),
            ),
          ),
          const SizedBox(width: 20),
        ]
            : <Widget>[SizedBox.shrink()],
      ),
      backgroundColor: bgcol,
      drawer: (hei * 0.85 > wid)
          ? Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'PTS Chemistry Class',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pushNamed(context, '/'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Study Materials / Tests'),
              onTap: () => Navigator.pushNamed(context, '/material'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Reviews'),
              onTap: () => Navigator.pushNamed(context, '/reviews'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('About Me'),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Contact'),
              onTap: () => Navigator.pushNamed(context, '/contact'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Sign Up'),
              onTap: () => Navigator.pushNamed(context, '/login'),
            ),
          ],
        ),
      )
          : null,
      body: isReview
          ? writeReview(context)
          : Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _reviewController.clear();
                    _nameController.clear();
                    _starRating=0;
                    isReview = true;
                  });
                },
                backgroundColor: const Color(0xFF91CC8F),
                child: const Text("Write a Review"),
              ),
              const SizedBox(height: 16),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('reviews')
                    .orderBy('timestamp', descending: true)  // Sort newest first
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
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
              )




            ],
          ),
        ],
      ),
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
                    color: Theme
                        .of(context)
                        .primaryColor),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _reviewController ,
                maxLines: 8,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText:
                  'Type your review here, include your grade, year, current position, and reviews about the class and experience.',
                ),
              ),
              const SizedBox(height: 10),

              // Inline star rating row starts here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _starRating ? Icons.star : Icons.star_border,
                      color: Color(0xFFFFD400),
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
              // Inline star rating row ends here

              TextField(
                controller: _nameController,
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
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
                    style:
                    ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF78D371)),
                      onPressed: () async {
                        if (_starRating == 0 || _nameController.text.isEmpty || _reviewController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please fill all the fields')),
                          );
                          return;  // prevent submission if incomplete
                        }

                        try {
                          // Await Firestore add operation
                          await FirebaseFirestore.instance.collection('reviews').add({
                            'name': _nameController.text.trim(),
                            'review': _reviewController.text.trim(),
                            'rating': _starRating,
                            'timestamp': FieldValue.serverTimestamp(),
                          });

                          // After successful submission clear fields and close form (inside setState)
                          setState(() {
                            isReview = false;
                            _starRating = 0;
                            _nameController.clear();
                            _reviewController.clear();
                          });

                          // Optionally show a success message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Review submitted successfully')),
                          );
                        } catch (e) {
                          // Handle errors here if needed
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Failed to submit review: $e')),
                          );
                        }
                      },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.black),
                    ),
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

  const ReviewCard(
      {super.key, required this.studentName, required this.reviewText, required rating});

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
            Text(
              '"$reviewText"',
              style:
              const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
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
