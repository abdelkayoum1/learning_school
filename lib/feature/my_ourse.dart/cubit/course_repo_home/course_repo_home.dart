import 'package:dartz/dartz.dart';
import 'package:fooditem/core/error/failure.dart';
import 'package:fooditem/feature/data/model/model_course.dart';

abstract class CourseRepoHome {
  Future<Either<Failure, List<ModelCourse>>> getcourse();
}
