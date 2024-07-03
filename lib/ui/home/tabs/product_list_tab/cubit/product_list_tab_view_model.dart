import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/entities/ProducResponseEntity.dart';
import '../../../../../domain/use_case/get_all_product_use_case.dart';

class ProductListTabViewModel extends Cubit<ProductListTabState>{
  GetAllProductsUseCase getAllProductsUseCase;
  ProductListTabViewModel({required this.getAllProductsUseCase}):super(ProductListTabInitialState());

  List<ProductEntity> productList = [];
  void getProducts()async{
    emit(ProductListTabLoadingState(loadingMessage: 'loading...........'));
   var either= await getAllProductsUseCase.invoke();
   either.fold((l){
     emit(ProductListTabErrorState(errors: l));
   }, (response){
       productList = response.data??[];
       emit(ProductListTabSuccessState(productResponseEntity: response
       ));
   });

  }
}