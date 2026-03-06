import 'package:dartz/dartz.dart';
import 'package:fooditem/core/error/failure.dart';
import 'package:fooditem/feature/data/model/model_course.dart';
import 'package:fooditem/feature/myvideo/data/my_video_home_repo/my_video_home_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyVideoHomeRepoImpl implements MyVideoHomeRepo {
  SupabaseClient supabase = Supabase.instance.client;

  @override
  Future<Either<Failure, List<ModelCourse>>> getvideo({
    required String courseId,
  }) async {
    try {
      List<ModelCourse> video = [];
      var resu = await supabase
          .from('vedeo')
          .select()
          .eq('course_id', courseId);

      for (var coursevideo in resu) {
        video.add(ModelCourse.fromJson(coursevideo));
        print(coursevideo);
      }
      return Right(video);
    } catch (e) {
      return Left(FailureServer(error: e.toString()));
    }
  }
}
