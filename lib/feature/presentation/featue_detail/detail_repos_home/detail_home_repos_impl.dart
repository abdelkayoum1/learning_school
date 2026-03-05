import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:fooditem/core/error/failure.dart';
import 'package:fooditem/core/widget/snackbar.dart';
import 'package:fooditem/feature/data/homerepo/home_repo/home_repo.dart';
import 'package:fooditem/feature/data/model/model_course.dart';
import 'package:fooditem/feature/presentation/featue_detail/detail_repos_home/detail_home_repos.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DetailHomeReposImpl implements DetailHomeRepos {
  User? user = Supabase.instance.client.auth.currentUser;
  SupabaseClient supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, void>> enrollcourse(courseid, userId) async {
    try {
      final check = await supabase
          .from('enrolle')
          .select()
          .eq('user_id', userId)
          .eq('course_id', courseid)
          .maybeSingle();

      if (check != null) {
        return Left(FailureServer(error: "already enrolled"));
      }

      print('start');
      final res = await supabase.from('enrolle').insert({
        'user_id': userId,
        'course_id': courseid,
      });

      print('fin');

      return right(null);
    } catch (e) {
      return Left(FailureServer(error: e.toString()));
    }
  }
}
