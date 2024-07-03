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