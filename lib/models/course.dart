import 'dart:ui';

class Course{
  final String title, description, iconSrc;
  final Color bgColor;

  Course({required this.title, this.description = "Build and animate an ios app from scratch ", this.iconSrc = 'assets/icons/ios.svg', this.bgColor = const Color(0xFF7553F6)});
}

List<Course> courses = [
  Course(title: 'Animation in SwiftUI'),
  Course(title: 'Animation in Flutter', bgColor: const Color(0xFF80A4FF), iconSrc: 'assets/icons/code.svg')
];

List<Course> recentCourses = [
  Course(title: 'State Machine'),
  Course(title: 'Animated Menu', bgColor: const Color(0xFF9CC5FF), iconSrc: 'assets/icons/code.svg'),
  Course(title: 'Flutter with Rive'),
  Course(title: 'Animated Menu', bgColor: const Color(0xFF9CC5FF), iconSrc: 'assets/icons/code.svg'),
];