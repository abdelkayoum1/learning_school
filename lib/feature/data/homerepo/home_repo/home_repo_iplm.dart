import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fooditem/core/error/failure.dart';
import 'package:fooditem/feature/data/homerepo/home_repo/home_repo.dart';
import 'package:gotrue/src/types/user.dart';
import 'package:supabase/src/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepoIplm implements HomeRepo {
  SupabaseClient supabase = Supabase.instance.client;

  late User? usere;

  @override
  Future<Either<Failure, bool>> login({
    required String email,
    required String password,
  }) async {
    try {
      AuthResponse reponse = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      usere = reponse.user;
      if (usere != null) {
        return Right(true);
      } else {
        return Right(false);
      }
    } catch (e) {
      if (e is AuthException) {
        print(e.message);
        return Left(FailureServer(error: e.message));
      }
      return Left(FailureServer(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signin({
    required String password,
    required String email,
    required String name,
  }) async {
    try {
      AuthResponse reponse = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      await get(name: name, email: email);
      usere = reponse.user;
      if (usere != null) {
        return Right(true);
      } else {
        return Right(false);
      }
    } catch (e) {
      if (e is AuthException) {
        return Left(FailureServer(error: e.message));
      }
      return Left(FailureServer(error: e.toString()));
    }
  }

  Future<Either<Failure, void>> get({
    required String name,
    required String email,
  }) async {
    try {
      final res = await supabase.from('users').insert({
        'id': supabase.auth.currentUser!.id,
        'name': name,
        'email': email,
      });
      return Right(null);
    } catch (e) {
      if (e is AuthException) {
        return Left(FailureServer());
      }
      return Left(FailureServer());
    }
  }

  @override
  Future<Either<Failure, void>> getcourse() async {
    try {
      var res = await supabase.from('course').select();
      return Right(null);
    } catch (e) {
      if (e is AuthException) {
        return Left(FailureServer());
      }
      return Left(FailureServer());
    }
  }
}
