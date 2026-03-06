import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fooditem/feature/data/model/model_course.dart';
import 'package:fooditem/feature/my_course/cubit/course_repo_home/course_repo_home.dart';

part 'mycourse_cubit_state.dart';

class MycourseCubitCubit extends Cubit<MycourseCubitState> {
  final CourseRepoHome homerepo;
  MycourseCubitCubit(this.homerepo) : super(MycourseCubitInitial());

  Future<void> getmycourse() async {
    try {
      emit(MycourseCubitloading());
      var resu = await homerepo.getcourse();
      resu.fold(
        (failure) {
          emit(MycourseCubitfailre(error: failure.error.toString()));
        },
        (course) {
          print('succes');
          emit(MycourseCubitsucces(cours: course));
        },
      );
    } catch (e) {
      emit(MycourseCubitfailre(error: e.toString()));
    }
  }
}
