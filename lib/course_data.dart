import 'package:flutter/material.dart';

class Course {
  String title;
  String description;
  String timings;
  String price;

  Course({
    required this.title,
    required this.description,
    required this.timings,
    required this.price,
  });
}

List<Course> courseData = [
    Course(
      title: 'Grade 9: Foundations of Chemistry',
      description: 'An introduction to the fundamental concepts of matter, atomic structure, the periodic table, and basic chemical bonding.',
      timings: 'Mon-Wed-Fri 3:00PM - 4:30PM',
      price: '₹200 per month',
    ),
    Course(
      title: 'Grade 10: Chemical Reactions & Stoichiometry',
      description: 'Explore different types of chemical reactions, learn to balance equations, and master the calculations of chemical quantities.',
      timings: 'Tue-Thu 4:00PM - 5:30PM',
      price: '₹220 per month',
    ),
    Course(
      title: 'Grade 11: Inorganic & Physical Chemistry',
      description: 'A deep dive into periodic trends, advanced bonding theories, thermodynamics, kinetics, and chemical equilibrium.',
      timings: 'Mon-Wed 5:00PM - 6:30PM',
      price: '₹300 per month',
    ),
    Course(
      title: 'Grade 12: Organic Chemistry Essentials',
      description: 'Discover the world of carbon compounds. Learn about hydrocarbons, functional groups, and the mechanisms of basic organic reactions.',
      timings: 'Tue-Thu 3:30PM - 5:00PM',
      price: '₹280 per month',
    ),
    Course(
      title: 'Advanced Placement (AP) Chemistry Prep',
      description: 'A rigorous, college-level course designed to prepare students for the AP Chemistry exam, covering all major topics in-depth.',
      timings: 'Mon-Fri 4:00PM - 6:00PM',
      price: '₹450 per month',
    ),
    Course(
      title: 'Chemistry Lab Skills & Safety Workshop',
      description: 'Gain hands-on confidence with essential laboratory techniques, proper use of equipment.',
      timings: 'Saturday 10:00AM - 12:00PM',
      price: '₹150 one-time',
    ),
];
