import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fooditem/core/error/failure.dart';
import 'package:fooditem/feature/data/model/model_course.dart';
import 'package:fooditem/feature/my_course/cubit/course_repo_home/course_repo_home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseRepoImple implements CourseRepoHome {
  static SupabaseClient supabase = Supabase.instance.client;
  final userId = Supabase.instance.client.auth.currentUser!.id;
  @override
  /* Future<Either<Failure, List<ModelCourse>>>*/
  Future<Either<Failure, List<ModelCourse>>> getcourse() async {
    try {
      var resul = await supabase
          .from('enrolle')
          .select('course(*)')
          .eq('user_id', userId);
      // Right(resul);
      print(resul);
      List<ModelCourse> cour = [];
      for (var course in resul) {
        print(course['title']);
        cour.add(ModelCourse.fromJson(course['course']));
      }
      return Right(cour);
    } catch (e) {
      if (e is AuthException) {
        return Left(FailureServer(error: e.toString()));
      }
      return Left(FailureServer(error: e.toString()));
    }
  }
}



/*



{id: 5a7bd074-a112-474b-bfe9-8443693a6bd8, 
created_at: 2026-03-05T13:01:18.915805+00:00,
 email: j@gmail.com, 
 name: Gjfj}
I/flutter (11369): {id: 3640ec86-1d5d-4e59-a526-bb4d4818c41a, created_at: 2026-03-05T13:22:06.342792+00:00, email: s@gmail.com, name: Gdkt}
I/flutter (11369): {id: 38dc123f-56fe-42c5-98fe-94a09e7887aa, created_at: 2026-03-05T13:51:49.140188+00:00, email: d@gmail.com, name: Kh}
*/