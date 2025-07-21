import 'package:flutter/material.dart';
// 1. Import the package with a prefix to permanently solve name conflicts.
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
        foregroundColor: Colors.black,
        elevation: 1.0,
        toolbarHeight: 70,
        title: const Text(
          'PTS Chemistry Class',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("images/icon.jpg"),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/courses'),
            style: navLinkStyle,
            child: const Text('Courses'),
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
            onPressed: () { /* Sign Up Logic */ },
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
        ],
      ),
      body: const CoursesPageContent(colossal: true,),
    );
  }
}

// The list of image URLs.
final List<String> imgList = [
  'https://images.unsplash.com/photo-1588702547919-26089e690ecc?q=80&w=2070',
  'https://images.unsplash.com/photo-1543269865-cbf427effbad?q=80&w=2070',
  'https://images.unsplash.com/photo-1517048676732-d65bc937f952?q=80&w=2070',
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

  // --- THIS IS THE FIX ---
  // The class is now named CarouselSliderController in this package version.
  final CarouselSliderController _controller = CarouselSliderController();
  // -----------------------

  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CarouselSlider(
          items: imgList.map((item) => ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            child: Image.network(item, fit: BoxFit.cover, width: wid),
          )).toList(),
          controller: _controller,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.5,
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
                      .withOpacity(_current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// 3. Definition order fixed: CourseCard is defined before it's used.
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
    final double elevation = _isHovered ? 16.0 : 4.0;
    final double scale = _isHovered ? 1.03 : 1.0;
    final Color shadowColor = _isHovered ? Theme.of(context).primaryColor.withValues(alpha: 0.5) : Colors.black;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          //print('Tapped on ${widget.title}');
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          transform: Matrix4.identity()..scale(scale),
          transformAlignment: FractionalOffset.center,
          width: 400,
          height: 200,
          child: Card(
            elevation: elevation,
            shadowColor: shadowColor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(widget.description, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CoursesPageContent extends StatelessWidget {
  final bool colossal;
  const CoursesPageContent({super.key, required this.colossal} );

  @override
  Widget build(BuildContext context) {
    // The extra Scaffold and Stack were removed to simplify the layout.
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
      children: <Widget>[
        (colossal)?CourseBannerCarousel():SizedBox.shrink(),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'Courses',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        Wrap(
          spacing: 20.0,
          runSpacing: 20.0,
          children: [
            CourseCard(
              title: 'Grade 9: Foundations of Chemistry',
              description: 'An introduction to the fundamental concepts of matter, atomic structure, the periodic table, and basic chemical bonding.',
            ),
            CourseCard(
              title: 'Grade 10: Chemical Reactions & Stoichiometry',
              description: 'Explore different types of chemical reactions, learn to balance equations, and master the calculations of chemical quantities.',
            ),
            CourseCard(
              title: 'Grade 11: Inorganic & Physical Chemistry',
              description: 'A deep dive into periodic trends, advanced bonding theories, thermodynamics, kinetics, and chemical equilibrium.',
            ),
            CourseCard(
              title: 'Grade 12: Organic Chemistry Essentials',
              description: 'Discover the world of carbon compounds. Learn about hydrocarbons, functional groups, and the mechanisms of basic organic reactions.',
            ),
            CourseCard(
              title: 'Advanced Placement (AP) Chemistry Prep',
              description: 'A rigorous, college-level course designed to prepare students for the AP Chemistry exam, covering all major topics in-depth.',
            ),
            CourseCard(
              title: 'Chemistry Lab Skills & Safety Workshop',
              description: 'Gain hands-on confidence with essential laboratory techniques, proper use of equipment.',
            ),

          ],
        ),
      ],
    );
  }
}
