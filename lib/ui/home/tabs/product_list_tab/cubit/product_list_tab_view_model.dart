import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/ui/home/tabs/product_list_tab/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/entities/ProducResponseEntity.dart';
import '../../../../../domain/use_case/Add_cart_use_use_Case.dart';
import '../../../../../domain/use_case/get_all_product_use_case.dart';

class ProductListTabViewModel extends Cubit<ProductListTabState>{
  GetAllProductsUseCase getAllProductsUseCase;
  AddCArtUseCase addCArtUseCase ;
  ProductListTabViewModel({required this.getAllProductsUseCase,required this.addCArtUseCase}):super(ProductListTabInitialState());

  List<ProductEntity> productList = [];
  int numOfCartItem = 0;
  static ProductListTabViewModel get(context)=>  BlocProvider.of(context);
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
  void addToCard(String productId)async{
    emit(AddToCardLoadingState(loadingMessage: 'loading...........'));
   var either= await addCArtUseCase.invoke(productId);
   either.fold((l){
     emit(AddToCardErrorState(errors: l));
   }, (response){
       // productList = response.data??[];

         numOfCartItem =response.numOfCartItems!.toInt();
         print('numberOfCartItem : ${response.numOfCartItems}');
         emit(AddToCardSuccessState(addCartResponseEntity: response
         ));


   });

  }

}