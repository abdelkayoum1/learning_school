import 'package:flutter/material.dart';
import 'package:fooditem/feature/presentation/login/screen/login_home.dart';
import 'package:fooditem/feature/presentation/navigation_bav/book.dart';
import 'package:fooditem/feature/presentation/navigation_bav/button_navigation_bar.dart';
import 'package:fooditem/feature/presentation/sign%20up/screen/singn.dart';
import 'package:fooditem/splash.dart';
import 'package:go_router/go_router.dart';

class Approute {
  static const loginhome = '/loginhome';
  static const signhome = '/signhome';
  static const buttonbar = '/ButtonNavigationBar';
  // '/';
  //'/ButtonNavigationBar';
  static const book = '/book';
  static final router = GoRouter(
    routes: [
      //  GoRoute(path: '/', builder: (context, state) => Splash()),
      GoRoute(path: loginhome, builder: (context, state) => LoginHome()),
      GoRoute(path: signhome, builder: (context, state) => SignIn()),

      GoRoute(path: '/', builder: (context, state) => ButtonNavigationBar()),
      GoRoute(path: book, builder: (context, state) => Booke()),
    ],
  );
}
