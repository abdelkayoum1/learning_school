import 'package:dartz/dartz.dart';
import 'package:fooditem/core/error/failure.dart';

abstract class DetailHomeRepos {
  Future<Either<Failure, void>> enrollcourse(courseId, userId);
}
