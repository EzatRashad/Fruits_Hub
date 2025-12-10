import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/home/presentation/views/home_view.dart';
import 'package:fruit_hub/features/products/presentation/view/products_view.dart';

import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeView(),
    ProductsView(),
    Scaffold(
      body: Center(
        child: Text("3"),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text("4"),
      ),
    ),
  ];

  void changeIndex(int index) {
    selectedIndex = index;
    emit(LayoutChangeIndexState());
  }
}
