import 'package:e_commerce_app/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_item.dart';

class CategoriesOrBrandsSection extends StatelessWidget {
  //todo: List<Category & brand>

   List<CategoryOrBrandEntity> categoryList ;
   CategoriesOrBrandsSection({required this.categoryList});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: GridView.builder(
          itemCount: categoryList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryOrBrandItem(categoryEntity: categoryList[index],);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          )),
    );
  }
}
