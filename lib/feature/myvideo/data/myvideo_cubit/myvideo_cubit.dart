import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooditem/feature/myvideo/data/my_video_home_repo/my_video_home_repo.dart';
import 'package:fooditem/feature/myvideo/data/myvideo_cubit/myvideo_state.dart';

class MyvideoCubit extends Cubit<MyvideoState> {
  final MyVideoHomeRepo videohomerepo;
  MyvideoCubit(this.videohomerepo) : super(MyvideoStateInitial());

  Future<void> getvideo({required String courseId}) async {
    try {
      emit(MyvideoStateloading());
      var resu = await videohomerepo.getvideo(courseId: courseId);
      resu.fold(
        (failure) {
          emit(MyvideoStatefailure(error: failure.error.toString()));
        },
        (coursevideo) {
          print('succes');
          emit(MyvideoStatesucces(coursevideo: coursevideo));
        },
      );
    } catch (e) {
      emit(MyvideoStatefailure(error: e.toString()));
    }
  }
}
