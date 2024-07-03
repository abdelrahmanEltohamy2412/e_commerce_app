import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/cubit/states.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/widgets/grid_view_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/my_assets.dart';
import '../../../utils/my_colors.dart';
import '../../product_details/product_details_view.dart';
import '../home_tab/widgets/custom_text_field.dart';
import 'cubit/product_list_tab_view_model.dart';

class ProductListTab extends StatelessWidget {
  ProductListTabViewModel viewModel = ProductListTabViewModel(getAllProductsUseCase: injectGetAllProductsUseCase(),
  addCArtUseCase:injectAddCArtUseCase()
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductListTabViewModel>(
      create: (context)=>viewModel..getProducts(),
      child: BlocBuilder<ProductListTabViewModel,ProductListTabState>(

        builder: (context,state){
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                    Row(children: [
                      Expanded(
                        child: CustomTextField(),
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      ImageIcon(
                        AssetImage(MyAssets.shoppingCart),
                        size: 28.sp,
                        color: AppColors.primaryColor,
                      ),
                    ]),
                    SizedBox(
                      height: 24.h,
                    ),
                    state is ProductListTabLoadingState?Center(child:
                      CircularProgressIndicator(),):

                    Expanded(
                      child: GridView.builder(
                        itemCount: viewModel.productList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.4,
                            crossAxisSpacing: 16.w,
                            mainAxisSpacing: 16.h),
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                ProductDetailsView.routeName,
                                arguments: viewModel.productList[index]
                              );
                            },
                            child: GridViewCardItem(productEntity: viewModel.productList[index],),
                          );
                        },
                      ),
                    )
                  ]),
            ),
          );
        },

      ),
    );
  }
}
