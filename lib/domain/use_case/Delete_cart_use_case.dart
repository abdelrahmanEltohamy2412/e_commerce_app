import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repository/repository/cart_repository.dart';

import '../entities/GetCardRsponseEntity.dart';
import '../entities/failures.dart';

class DeleteCartUseCase{
  CartRepository cartRepository;
  DeleteCartUseCase({required this.cartRepository});
  Future<Either<Failures, GetCardResponseEntity>>  invoke(String productId){
    return cartRepository.deleteCart(productId);
  }
}