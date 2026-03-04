import 'package:fooditem/feature/data/model/model_course.dart';

abstract class CourseState {}

class Coursestateloading extends CourseState {}

class Coursestateinitial extends CourseState {}

class Coursestatesucces extends CourseState {
  final List<ModelCourse> course;

  Coursestatesucces({required this.course});
}

class Coursestatefailure extends CourseState {
  final String error;
  Coursestatefailure({required this.error});
}
