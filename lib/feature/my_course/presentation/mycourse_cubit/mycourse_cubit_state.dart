part of 'mycourse_cubit_cubit.dart';

sealed class MycourseCubitState extends Equatable {
  const MycourseCubitState();

  @override
  List<Object> get props => [];
}

final class MycourseCubitInitial extends MycourseCubitState {}

final class MycourseCubitloading extends MycourseCubitState {}

final class MycourseCubitsucces extends MycourseCubitState {
  final List<ModelCourse> cours;

  const MycourseCubitsucces({required this.cours});
}

final class MycourseCubitfailre extends MycourseCubitState {
  final String error;

  MycourseCubitfailre({required this.error});
}
