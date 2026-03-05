import 'package:dartz/dartz.dart';
import 'package:fooditem/core/error/failure.dart';
import 'package:fooditem/feature/data/model/model_course.dart';
import 'package:fooditem/feature/data/model/model_name.dart';

abstract class HomeRepo {
  Future<Either<Failure, void>> login({
    required String email,

    required String password,
  });

  Future<Either<Failure, void>> signUp({
    required String password,
    required String email,
    required String name,
  });

  Future<Either<Failure, List<ModelCourse>>> getcourse();

  Future<Either<Failure, List<Modelname>>> getname();
}
