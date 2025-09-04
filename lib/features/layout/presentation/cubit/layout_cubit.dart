import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int selectedIndex = 0;
  List<Widget> screens = [
   Scaffold(
      body: Center(
        child: Text("1"),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text("2"),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text("3"),
      ),
    ),
  ];

  void changeIndex(int index) {
    selectedIndex = index;
    emit(LayoutChangeIndexState());
  }
}
