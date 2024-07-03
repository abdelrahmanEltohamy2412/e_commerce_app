import 'package:e_commerce_app/domain/entities/AddCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/ProducResponseEntity.dart';

import '../../../../../domain/entities/failures.dart';

abstract class ProductListTabState{}

class ProductListTabInitialState extends ProductListTabState{}

class ProductListTabLoadingState extends ProductListTabState{
  String loadingMessage;
  ProductListTabLoadingState({required this.loadingMessage});
}
class ProductListTabErrorState extends ProductListTabState {
  Failures ? errors;
  ProductListTabErrorState({required this.errors});
}
class ProductListTabSuccessState extends ProductListTabState{
  ProductResponseEntity productResponseEntity;
  ProductListTabSuccessState({required this.productResponseEntity});
}
class AddToCardLoadingState extends ProductListTabState{
  String loadingMessage;
  AddToCardLoadingState({required this.loadingMessage});
}
class AddToCardErrorState extends ProductListTabState {
  Failures ? errors;
  AddToCardErrorState({required this.errors});
}
class AddToCardSuccessState extends ProductListTabState{
  AddCartResponseEntity addCartResponseEntity;
  AddToCardSuccessState({required this.addCartResponseEntity});
}