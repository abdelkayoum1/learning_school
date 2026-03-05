import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fooditem/core/error/failure.dart';
import 'package:fooditem/feature/data/model/model_course.dart';
import 'package:fooditem/feature/my_ourse.dart/cubit/course_repo_home/course_repo_home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseRepoImple {
  static SupabaseClient supabase = Supabase.instance.client;
  @override
  /* Future<Either<Failure, List<ModelCourse>>>*/
  static getcourse({required String userId}) async {
    try {
      var resul = await supabase
          .from('enrolle')
          .select('course(*)')
          .eq('user_id', userId);
      // Right(resul);
    } catch (e) {
      if (e is AuthException) {
        //   Left(FailureServer(error: e.toString()));
      }
      // Left(FailureServer(error: e.toString()));
    }
  }
}
