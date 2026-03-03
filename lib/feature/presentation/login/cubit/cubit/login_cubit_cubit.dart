import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fooditem/feature/data/homerepo/home_repo/home_repo.dart';

part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  final HomeRepo homerepo;

  LoginCubitCubit(this.homerepo) : super(LoginCubitInitial());
  Future<void> getlogin({
    required String password,
    required String email,
    required String name,
  }) async {
    emit(LoginCubitloading());
    try {
      var resultat = await homerepo.login(email: email, password: password);

      resultat.fold(
        (failure) {
          print(failure.error);
          emit(LoginCubitfailure(error: failure.error.toString()));
        },
        (user) {
          print("succes");
          emit(LoginCubitsucces(email: email, password: password));
        },
      );
    } catch (e) {
      emit(LoginCubitfailure(error: e.toString()));
    }
  }
}
