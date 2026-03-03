import 'package:dartz/dartz.dart';
import 'package:fooditem/core/error/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, bool>> login({
    required String email,

    required String password,
  });

  Future<Either<Failure, bool>> signin({
    required String password,
    required String email,
    required String name,
  });

  Future<Either<Failure, void>> getcourse();
}
