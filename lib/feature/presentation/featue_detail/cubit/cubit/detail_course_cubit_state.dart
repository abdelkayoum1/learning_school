part of 'detail_course_cubit_cubit.dart';

abstract class DetailCourseCubitState {}

final class DetailCourseCubitInitial extends DetailCourseCubitState {}

final class DetailCourseCubitloading extends DetailCourseCubitState {}

final class DetailCourseCubitsucces extends DetailCourseCubitState {}

final class DetailCourseCubitfailure extends DetailCourseCubitState {
  final String? error;

  DetailCourseCubitfailure({required this.error});
}
