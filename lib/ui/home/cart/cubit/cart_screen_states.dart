import 'package:e_commerce_app/domain/entities/AddCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/GetCardRsponseEntity.dart';

import '../../../../domain/entities/failures.dart';

abstract class CartScreenStates {}

class CartInitialState extends CartScreenStates{}
class GetCartLoadingState extends CartScreenStates{
  String loadingMessage;
  GetCartLoadingState({required this.loadingMessage});
}
class GetCartErrorState extends CartScreenStates {
  Failures ? errors;
  GetCartErrorState({required this.errors});
}
class GetCartSuccessState extends CartScreenStates{
  GetCardResponseEntity cartResponseEntity;
  GetCartSuccessState({required this.cartResponseEntity});
}
class DeleteItemInCartLoadingState extends CartScreenStates{
  String loadingMessage;
  DeleteItemInCartLoadingState({required this.loadingMessage});
}
class DeleteItemInCartErrorState extends CartScreenStates {
  Failures ? errors;
  DeleteItemInCartErrorState({required this.errors});
}
class DeleteItemInCartSuccessState extends CartScreenStates{
  GetCardResponseEntity cartResponseEntity;
  DeleteItemInCartSuccessState({required this.cartResponseEntity});
}
class UpdateItemInCartLoadingState extends CartScreenStates{
  String loadingMessage;
  UpdateItemInCartLoadingState({required this.loadingMessage});
}
class UpdateItemInCartErrorState extends CartScreenStates {
  Failures ? errors;
  UpdateItemInCartErrorState({required this.errors});
}
class UpdateItemInCartSuccessState extends CartScreenStates{
  GetCardResponseEntity cartResponseEntity;
  UpdateItemInCartSuccessState({required this.cartResponseEntity});
}