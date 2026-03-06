import 'package:fooditem/feature/data/model/model_course.dart';

class MyvideoState {}

final class MyvideoStateInitial extends MyvideoState {}

final class MyvideoStateloading extends MyvideoState {}

final class MyvideoStatesucces extends MyvideoState {
  final List<ModelCourse> coursevideo;

  MyvideoStatesucces({required this.coursevideo});
}

final class MyvideoStatefailure extends MyvideoState {
  final String error;

  MyvideoStatefailure({required this.error});
}
