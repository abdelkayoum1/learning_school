import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooditem/feature/data/homerepo/home_repo/home_repo.dart';
import 'package:fooditem/feature/presentation/feature_home_book/cubit/course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final HomeRepo homerepo;
  CourseCubit(this.homerepo) : super(Coursestateinitial());

  Future<void> getcourse() async {
    try {
      emit(Coursestateloading());
      var res = await homerepo.getcourse();
      res.fold(
        (failure) {
          emit(Coursestatefailure(failure.error.toString()));
        },
        (course) {
          emit(Coursestatesucces());
        },
      );
    } on Exception catch (e) {
      emit(Coursestatefailure(e.toString()));
    }
  }
}
