
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AddCartResponseEntity.dart';
import 'package:e_commerce_app/domain/repository/repository/home_tab_repository.dart';

import '../entities/CategoryOrBrandResponseEntity.dart';
import '../entities/failures.dart';

class AddCArtUseCase{
  HomeRepository homeTabRepository;
  AddCArtUseCase({required this.homeTabRepository});

  Future<Either<Failures, AddCartResponseEntity>>  invoke(String productId){
    return homeTabRepository.addProducts(productId);
  }
}