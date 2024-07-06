import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repository/repository/cart_repository.dart';

import '../entities/GetCardRsponseEntity.dart';
import '../entities/failures.dart';

class GatCartUseCase{
  CartRepository cartRepository;
  GatCartUseCase({required this.cartRepository});
  Future<Either<Failures, GetCardResponseEntity>>  invoke(){
    return cartRepository.getCart();
  }
}