import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooditem/feature/data/homerepo/home_repo/home_repo.dart';
import 'package:fooditem/feature/presentation/feature_home_book/cubit1.dart/name_course_state.dart';

class NameLogoutCubit extends Cubit<NameCourseState> {
  final HomeRepo homerepo;
  NameLogoutCubit(this.homerepo) : super(Namecourseinitial());

  Future<void> logout() async {
    try {
      emit(Namecourseloading());
      var res = await homerepo.logout();
      print('succes');
    } catch (e) {
      // TODO
    }
  }
}
