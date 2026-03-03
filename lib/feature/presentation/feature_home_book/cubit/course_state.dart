import 'package:fooditem/feature/data/model/model_course.dart';

class CourseState {}

class Coursestateloading extends CourseState {}

class Coursestateinitial extends CourseState {}

class Coursestatesucces extends CourseState {}

class Coursestatefailure extends CourseState {
  final String error;
  Coursestatefailure(this.error);
}
