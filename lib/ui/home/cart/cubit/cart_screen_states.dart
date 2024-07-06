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