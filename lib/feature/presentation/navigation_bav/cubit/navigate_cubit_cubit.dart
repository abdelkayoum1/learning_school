import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fooditem/feature/presentation/feature_home_book/feature_home_book.dart';
import 'package:fooditem/feature/presentation/login/screen/login_home.dart';
import 'package:fooditem/feature/presentation/navigation_bav/book.dart';
import 'package:fooditem/feature/presentation/sign%20up/screen/singn.dart';

part 'navigate_cubit_state.dart';

class NavigateCubitCubit extends Cubit<NavigateCubitState> {
  NavigateCubitCubit() : super(NavigateCubitInitial());
  int currentindex = 0;
  List<Widget> list = [FeatureHomeBook(), SignIn(), Booke()];

  void change(int index) {
    currentindex = index;
    emit(NavigateCubitsucces());
  }
}
