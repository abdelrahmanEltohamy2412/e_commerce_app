import 'package:e_commerce_app/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';

abstract class HomeTabStates {}

class HomeTabInitialStates extends HomeTabStates{}

class CategoryLoadingState extends HomeTabStates{
  String loadingMessage;
  CategoryLoadingState({required this.loadingMessage});
}
class CategoryErrorState extends HomeTabStates {
  Failures ? errors;
  CategoryErrorState({required this.errors});
}
class CategorySuccessState extends HomeTabStates{

  CategoryOrBrandResponseEntity categoryResponseEntity ;
  CategorySuccessState({required this.categoryResponseEntity});
}
class BrandLoadingState extends HomeTabStates{
  String loadingMessage;
  BrandLoadingState({required this.loadingMessage});
}
class BrandErrorState extends HomeTabStates {
  Failures ? errors;
  BrandErrorState({required this.errors});
}
class BrandSuccessState extends HomeTabStates{

  CategoryOrBrandResponseEntity categoryResponseEntity ;
  BrandSuccessState({required this.categoryResponseEntity});
}
