import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/GetCardRsponseEntity.dart';
import '../../../../domain/use_case/Delete_cart_use_case.dart';
import '../../../../domain/use_case/gat_cart_use_case.dart';
import '../../../../domain/use_case/update_cart_use_case.dart';
import 'cart_screen_states.dart';

class CartScreenViewModel extends Cubit<CartScreenStates>{
  GatCartUseCase gatCartUseCase;
  DeleteCartUseCase deleteCartUseCase;
  UpdateCartUseCase updateCartUseCase;
  CartScreenViewModel({required this.gatCartUseCase,required this.updateCartUseCase,required this.deleteCartUseCase,}):super(CartInitialState());

  List<GetProductCartEntity> getDataCartList=[];
  getCart()async{
    emit(GetCartLoadingState(loadingMessage: 'loading...........'));
    var either =await gatCartUseCase.invoke();
     either.fold((l){
       emit(GetCartErrorState(errors: l));
     }, (r){
       getDataCartList = r.data!.products!;
       emit(GetCartSuccessState(cartResponseEntity: r));
     });
  }
  static CartScreenViewModel get(context)=> BlocProvider.of(context);
  deleteItemInCart(String productId)async{

    var either =await deleteCartUseCase.invoke(productId);
     either.fold((l){
       emit(DeleteItemInCartErrorState(errors: l));
     }, (r){

       emit(GetCartSuccessState(cartResponseEntity: r));
     });
  }
  updateItemInCart(int count,String productId)async{

    var either =await updateCartUseCase.invoke(count,productId);
     either.fold((l){
       emit(UpdateItemInCartErrorState(errors: l));
     }, (r){

       emit(GetCartSuccessState(cartResponseEntity: r));
     });
  }
}