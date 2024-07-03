import 'package:e_commerce_app/domain/use_case/get_all_Brands_useCase.dart';
import 'package:e_commerce_app/ui/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/entities/CategoryOrBrandResponseEntity.dart';
import '../../../../../domain/use_case/get_all_categories_useCase.dart';

class HomeTabViewModel extends Cubit<HomeTabStates>{

  HomeTabViewModel ({required this.getAllCategoriesUseCase,required this.getAllBrandsUseCase}) : super (HomeTabInitialStates());
  GetAllCategoriesUseCase getAllCategoriesUseCase ;
 GetAllBrandsUseCase getAllBrandsUseCase;
  List<CategoryOrBrandEntity> categoriesList =[];
   List<CategoryOrBrandEntity> brandsList =[];

  void getAllCategories()async{
    emit(CategoryLoadingState(loadingMessage: 'Loading'));
   var either = await getAllCategoriesUseCase.invoke();
  return either.fold((l){
    emit(CategoryErrorState(errors: l));
  }, (response){
    categoriesList =response.data??[];

    emit(CategorySuccessState(categoryResponseEntity: response));
  });
  }
   void getAllBrands()async{
    emit(BrandLoadingState(loadingMessage: 'Loading'));
   var either = await getAllBrandsUseCase.invoke();
  return either.fold((l){
    emit(BrandErrorState(errors: l));
  }, (response){
    brandsList =response.data??[];

    emit(BrandSuccessState(categoryResponseEntity: response));
  });
  }



}