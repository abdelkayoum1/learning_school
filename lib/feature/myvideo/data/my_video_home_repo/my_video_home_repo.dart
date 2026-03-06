import 'package:dartz/dartz.dart';
import 'package:fooditem/core/error/failure.dart';
import 'package:fooditem/feature/data/model/model_course.dart';

abstract class MyVideoHomeRepo {
  Future<Either<Failure, List<ModelCourse>>> getvideo({
    required String courseId,
  });
}
