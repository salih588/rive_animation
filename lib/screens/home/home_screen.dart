import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/course.dart';
import 'components/course_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Courses',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                  child: Row(children: [...courses.map((course) => Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: CourseCard(course: course),
                  )).toList(),],)),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Recent', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),),
              ),
              ...recentCourses.map((course) => Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: SecondaryCourseCard(course: course,),
              ),),
          
            ],
          ),
        ),
      ),
    );
  }
}

class SecondaryCourseCard extends StatelessWidget {
  const SecondaryCourseCard({
    super.key, required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: course.bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(children: [
         Expanded(child: Column(children: [
          Text(course.title, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w600),),
           const Text("Watch video - 15 mins", style: TextStyle(color: Colors.white60, fontSize: 16,),)
        ],)),
        const SizedBox(
          height: 40,
          child: VerticalDivider(color: Colors.white70,),),
        const SizedBox(width: 8,),
        SvgPicture.asset(course.iconSrc),
      ],),
    );
  }
}