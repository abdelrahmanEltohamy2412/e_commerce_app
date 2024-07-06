import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/GetCardRsponseEntity.dart';
import '../../../../domain/use_case/gat_cart_use_case.dart';
import 'cart_screen_states.dart';

class CartScreenViewModel extends Cubit<CartScreenStates>{
  GatCartUseCase gatCartUseCase;
  CartScreenViewModel({required this.gatCartUseCase}):super(CartInitialState());

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
}