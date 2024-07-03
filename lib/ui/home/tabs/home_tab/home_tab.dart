import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/widgets/annountcements_section.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/widgets/categories_or_brands_section.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/widgets/custom_search_with_shopping_cart.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/widgets/row_section_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/my_assets.dart';
import '../../../utils/my_colors.dart';

class HomeTab extends StatelessWidget {
  HomeTabViewModel viewModel =HomeTabViewModel(getAllCategoriesUseCase: injectGatAllCategoriesUseCase(), getAllBrandsUseCase: injectGetAllBrandsUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: viewModel..getAllCategories()..getAllBrands(),
      builder: (context,state){
        return  SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Image.asset(
                    MyAssets.logo,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  CustomSearchWithShoppingCart(),
                  SizedBox(
                    height: 16.h,
                  ),
                  AnnouncementsSection(),
                  SizedBox(
                    height: 16.h,
                  ),
                  RowSectionWidget(name: 'Categories'),
                  SizedBox(
                    height: 24.h,
                  ),
                  state is CategoryLoadingState?
                      const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ):
                  CategoriesOrBrandsSection(categoryList: viewModel.categoriesList,),
                  SizedBox(
                    height: 24.h,
                  ),
                  RowSectionWidget(name: 'Brands'),
                  SizedBox(
                    height: 24.h,
                  ),
                  state is BrandLoadingState?const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),)
                  :
                  CategoriesOrBrandsSection(categoryList: viewModel.brandsList,),
                  Padding(padding: EdgeInsets.only(bottom: 6.h))
                ],
              ),
            ),
          ),
        );
      },


    );
  }
}
