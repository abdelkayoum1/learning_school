import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fooditem/feature/data/homerepo/home_repo/home_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'signin_cubit_state.dart';

class SigninCubitCubit extends Cubit<SigninCubitState> {
  final HomeRepo homerepo;
  SigninCubitCubit(this.homerepo) : super(SigninCubitInitial());

  Future<void> getsign({
    required String password,
    required String email,
    required String name,
  }) async {
    emit(SignCubitloading());
    try {
      var resultat = await homerepo.signUp(
        email: email,
        password: password,
        name: name,
      );

      resultat.fold(
        (failure) {
          emit(SignCubitfailure(error: failure.error.toString()));
        },
        (user) {
          emit(SignCubitsucces(email: email, password: password));
        },
      );
    } catch (e) {
      emit(SignCubitfailure(error: e.toString()));
    }
  }
}
