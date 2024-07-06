import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repository/repository/cart_repository.dart';

import '../entities/GetCardRsponseEntity.dart';
import '../entities/failures.dart';

class UpdateCartUseCase{
  CartRepository cartRepository;
  UpdateCartUseCase({required this.cartRepository});
  Future<Either<Failures, GetCardResponseEntity>>  invoke(int count,String productId){
    return cartRepository.updateCountInCart(count,productId);
  }
}