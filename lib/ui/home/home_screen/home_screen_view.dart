import 'package:e_commerce_app/ui/home/home_screen/cubit/home_screen_view.dart';
import 'package:e_commerce_app/ui/home/home_screen/widget/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../tabs/favorite_tab/favorite_tab.dart';
import '../tabs/home_tab/home_tab.dart';
import '../tabs/product_list_tab/product_list_tab.dart';
import '../tabs/profile_tab/profile_tab.dart';


class HomeScreenView extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {


  @override
  Widget build(BuildContext context) {
    HomeScreenViewModel viewModel = HomeScreenViewModel();
    return BlocBuilder(
        builder: (context ,state){
          return Scaffold(
            bottomNavigationBar: buildCustomBottomNavigationBar(
              context: context,
              selectedIndex: viewModel.selectedIndex,
              onTapFunction: (index) {
                viewModel.changSelectedIndex(index);
              },
            ),
            body:viewModel.tabs[viewModel.selectedIndex],
          );
        },
      bloc: viewModel,


    );

  }
}
