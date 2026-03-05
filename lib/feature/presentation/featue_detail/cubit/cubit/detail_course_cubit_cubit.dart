import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_streaming.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:fooditem/core/error/failure.dart';
import 'package:fooditem/feature/data/homerepo/home_repo/home_repo.dart';
import 'package:fooditem/feature/presentation/featue_detail/detail_repos_home/detail_home_repos.dart';

part 'detail_course_cubit_state.dart';

class DetailCourseCubitCubit extends Cubit<DetailCourseCubitState> {
  final DetailHomeRepos homeRepo;
  DetailCourseCubitCubit(this.homeRepo) : super(DetailCourseCubitInitial());

  // ignore: strict_top_level_inference
  Future<String> getenrolle(courseId, userId) async {
    try {
      emit(DetailCourseCubitloading());
      var resu = await homeRepo.enrollcourse(courseId, userId);
      resu.fold(
        (failure) {
          print(failure);

          emit(DetailCourseCubitfailure(error: failure.error));
        },
        (course) {
          print('succes');
          //print(course);

          emit(DetailCourseCubitsucces());
        },
      );
    } catch (e) {
      emit(DetailCourseCubitfailure(error: e.toString()));
    }
    return 'not found';
  }

  // ignore: strict_top_level_inference
  Future<void> getallcourse({
    required String courseId,
    required String userId,
  }) async {
    var resultat = await homeRepo.enrollallcourse(
      courseId: courseId,
      userId: userId,
    );
    resultat.fold(
      (failure) {
        emit(DetailCourseCubitfailure(error: failure.error));
      },
      (isalready) {
        if (isalready) {
          emit(AlreadyCourseCubit());
        } else {
          emit(NotalreadyCourse());
        }
      },
    );
  }
}
