import 'package:e_commerce_app/ui/home/home_screen/cubit/homeStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tabs/favorite_tab/favorite_tab.dart';
import '../../tabs/home_tab/home_tab.dart';
import '../../tabs/product_list_tab/product_list_tab.dart';
import '../../tabs/profile_tab/profile_tab.dart';

class HomeScreenViewModel extends Cubit<HomeStates>{
  HomeScreenViewModel() : super(HomeInitialHomeState());
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    ProductListTab(),
    FavoriteTab(),
    ProfileTab()
  ];
  void changSelectedIndex(int newSelectedIndex){
    emit(HomeInitialHomeState());
    selectedIndex = newSelectedIndex;
    emit(ChangBottomNavigationBarState());
  }
}