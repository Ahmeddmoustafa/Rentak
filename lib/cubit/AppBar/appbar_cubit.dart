import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:rentak/cubit/AppBar/appbar_state.dart';
part 'appbar_state.dart';

class AppBarCubit extends Cubit<AppBarState> {
  bool scrolled = false;
  late ScrollUpdateNotification notification;

  AppBarCubit() : super(AppBarInitial());

  bool isScrolled(ScrollUpdateNotification notific, double height) {
    emit(AppBarInitial());
    notification = notific;

    if (notification.metrics.axis == Axis.vertical) {
      scrolled = notification.metrics.pixels > height ? true : false;
      print("app bar scrolled $scrolled");
    }
    emit(IsAppBarScrolled());
    return scrolled;
  }
}
