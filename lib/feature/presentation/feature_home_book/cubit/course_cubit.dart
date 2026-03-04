import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooditem/feature/data/homerepo/home_repo/home_repo.dart';
import 'package:fooditem/feature/data/model/model_course.dart';
import 'package:fooditem/feature/presentation/feature_home_book/cubit/course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final HomeRepo homerepo;
  CourseCubit(this.homerepo) : super(Coursestateinitial());

  Future<void> getcourse() async {
    try {
      emit(Coursestateloading());
      var res = await homerepo.getcourse();
      print(res);
      res.fold(
        (failure) {
          emit(Coursestatefailure(error: failure.error.toString()));
        },
        (course) {
          print('succes');
          print(course);
          print(course.first.title);
          emit(Coursestatesucces(course: course));
        },
      );
    } catch (e) {
      emit(Coursestatefailure(error: e.toString()));
    }
  }
}
