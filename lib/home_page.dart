import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:ptschemistryclass/course_data.dart' as course_data_lib;
import 'dart:ui' as ui;
import 'courses_page.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _coursesKey = GlobalKey();

  void _scrollToCourses() {
    final context = _coursesKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
    var wid = MediaQuery.of(context).size.width;
    var hei = MediaQuery.of(context).size.height;
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
          const Text('PTS Chemistry Class', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        ]),
        actions: (hei < wid * 0.9)
            ? <Widget>[
          TextButton(
            onPressed: _scrollToCourses,
            style: navLinkStyle,
            child: const Text('Courses'),
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
        ]
            : <Widget>[const SizedBox.shrink()],
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
              leading: const Icon(Icons.home_outlined),
              title: const Text('Courses'),
              onTap: () {
                Navigator.pop(context);
                _scrollToCourses();
              },
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
      body: CoursesPageContent(
        controller: _scrollController,
        coursesKey: _coursesKey,
      ),
      backgroundColor: bgcol,
    );
  }
}

// Carousel Images
final List<String> imgList = [
  'images/Screenshot 2025-07-25 201433.png',
  'images/pts2.jpg',
  'images/Screenshot 2025-07-25 201618.png',
  'images/WhatsApp Image 2025-07-27 at 14.43.43_7dc43aa2.jpg',
];

class CourseBannerCarousel extends StatefulWidget {
  const CourseBannerCarousel({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CourseBannerCarouselState();
  }
}

class _CourseBannerCarouselState extends State<CourseBannerCarousel> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CarouselSlider(
          items: imgList
              .map((item) => ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            child: item.startsWith('http')
                ? Image.network(item, fit: BoxFit.cover, width: wid)
                : Image.asset(item, fit: BoxFit.cover, width: wid),
          ))
              .toList(),
          controller: _controller,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: ((MediaQuery.of(context).size.height > MediaQuery.of(context).size.width * 0.8) ? 1.5 : 2.8),
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                      .withValues(alpha: _current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// --- Stylish CourseCard ---

class CourseCard extends StatefulWidget {
  final String title;
  final String description;

  const CourseCard({super.key, required this.title, required this.description});

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final double elevation = _isHovered ? 24.0 : 8.0;
    final double scale = _isHovered ? 1.05 : 1.0;
    final Color shadowColor = _isHovered
        ? Theme.of(context).primaryColor.withValues(alpha: 0.4)
        : Colors.black26;
    var wid = MediaQuery.of(context).size.width;
    var hei = MediaQuery.of(context).size.height;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          if (course_data_lib.courseData.any((course) => course.title == widget.title)) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoursesPage(title: widget.title),
                ));
          } else {
            Navigator.pushNamed(context, '/about');
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          transform: Matrix4.identity()..scale(scale),
          transformAlignment: FractionalOffset.center,
          width: (wid < 840) ? wid * 0.9 : 380,
          height: (hei < wid) ? 250 : 290,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: _isHovered
                ? LinearGradient(
              colors: [
                Theme.of(context).primaryColor.withValues(alpha: 0.7),
                Theme.of(context).primaryColor.withValues(alpha: 0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
                : LinearGradient(
              colors: [
                Colors.purple.shade50,
                Colors.purple.shade100,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                offset: const Offset(0, 8),
                blurRadius: elevation,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                if (course_data_lib.courseData.any((course) => course.title == widget.title)) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CoursesPage(title: widget.title),
                      ));
                } else {
                  Navigator.pushNamed(context, '/about');
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.school,
                          size: 28,
                          color: _isHovered ? Colors.white : Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: _isHovered ? Colors.white : Colors.black87,
                              shadows: _isHovered
                                  ? [
                                Shadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 3.0,
                                  color: Colors.black26,
                                )
                              ]
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: Text(
                        widget.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: _isHovered ? Colors.white70 : Colors.black54,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.arrow_forward,
                        color: _isHovered ? Colors.white : Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --- Passes controller and key to CoursesPageContent ---
class CoursesPageContent extends StatelessWidget {
  final ScrollController? controller;
  final GlobalKey? coursesKey;

  const CoursesPageContent({
    super.key,
    this.controller,
    this.coursesKey,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 20.0),
      controller: controller,
      children: <Widget>[
        const CourseBannerCarousel(),
        const SizedBox(height: 20),
        Wrap(
            alignment: WrapAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 2.0),
                child: Text(
                  'Courses',
                  key: coursesKey,
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 20.0,
          runSpacing: 20.0,
          children: course_data_lib.courseData.map((course) {
            return CourseCard(
              title: course.title,
              description: course.description,
            );
          }).toList(),
        ),
        const SizedBox(height: 50),
        const Wrap(
            alignment: WrapAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Text(
                  'Why PTS?',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
        SizedBox(height: 20,),
        const Wrap(
          alignment: WrapAlignment.center,
          spacing: 20.0,
          runSpacing: 20.0,
          children: [
            CourseCard(
              title: 'Expert & Passionate Instructor',
              description: 'Learn from an experienced educator with a Master\'s in Chemistry, dedicated to making complex topics clear and accessible for every student.',
            ),
            CourseCard(
              title: 'Personalized Attention',
              description: 'Our small group sessions ensure that every student gets individual attention. Ask questions freely and learn at a pace that is comfortable for you.',
            ),
            CourseCard(
              title: 'Achieve Academic Excellence',
              description: 'Join a community of successful students. Our methods are proven to boost grades, improve test scores, and build lasting confidence in chemistry.',
            ),
            CourseCard(
              title: 'Go Beyond the Textbook',
              description: 'Experience chemistry through interactive online tools, real-world examples, and engaging problem-solving sessions that make learning effective and fun.',
            ),
            CourseCard(
              title: 'Comprehensive Exam Preparation',
              description: 'Get fully prepared for school exams, standardized tests (SAT/ACT), and AP Chemistry with targeted strategies and extensive practice materials.',
            ),
            CourseCard(
              title: 'Build a Strong Foundation for the Future',
              description: 'Develop critical thinking and a deep understanding of core concepts that will prepare you for success in university-level courses.',
            ),
          ],
        ),
        SizedBox(height: 25,),
        Wrap(
            alignment: WrapAlignment.center,
            children: [
          TextButton(
          child: const Text('Check out My Lectures',style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
           onPressed: () { Navigator.pushNamed(context, '/videos');},
        ),
        ]),
        SizedBox(height: 30,),
      ],
    );
  }
}
