import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooditem/feature/data/homerepo/home_repo/home_repo_iplm.dart';
import 'package:fooditem/feature/data/model/model_course.dart';
import 'package:fooditem/feature/my_course/presentation/screen/my_course.dart';
import 'package:fooditem/feature/myvideo/presentation/screen/my_video.dart';
import 'package:fooditem/feature/presentation/featue_detail/feature_detail.dart';
import 'package:fooditem/feature/presentation/feature_home_book/cubit/course_cubit.dart';
import 'package:fooditem/feature/presentation/login/screen/login_home.dart';
import 'package:fooditem/feature/presentation/navigation_bav/book.dart';
import 'package:fooditem/feature/presentation/navigation_bav/button_navigation_bar.dart';
import 'package:fooditem/feature/presentation/sign%20up/screen/singn.dart';
import 'package:fooditem/splash.dart';
import 'package:go_router/go_router.dart';

class Approute {
  static const loginhome = '/';

  static const signhome = '/signhome';
  static const buttonbar = '/ButtonNavigationBar';
  static const featuredetail = '/featuredetail';

  static const book = '/book';
  static const myvideo = '/myveideo';
  static final router = GoRouter(
    routes: [
      //  GoRoute(path: '/', builder: (context, state) => Splash()),
      GoRoute(path: loginhome, builder: (context, state) => LoginHome()),
      GoRoute(path: signhome, builder: (context, state) => SignIn()),

      GoRoute(
        path: buttonbar,
        builder: (context, state) => ButtonNavigationBar(),
      ),

      //   GoRoute(path: book, builder: (context, state) => Booke()),
      GoRoute(
        path: myvideo,
        builder: (context, state) => MyVideo(coursId: state.extra as String),
      ),
      GoRoute(
        path: featuredetail,
        builder: (context, state) => BlocProvider(
          create: (context) => CourseCubit(HomeRepoIplm()),
          child: FeatureDetail(course: state.extra as ModelCourse),
        ),
      ),
    ],
  );
}
