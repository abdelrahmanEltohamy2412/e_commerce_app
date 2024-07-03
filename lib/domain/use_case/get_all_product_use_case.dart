
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/ProducResponseEntity.dart';
import 'package:e_commerce_app/domain/repository/repository/home_tab_repository.dart';

import '../entities/CategoryOrBrandResponseEntity.dart';
import '../entities/failures.dart';

class GetAllProductsUseCase{
  HomeTabRepository homeTabRepository;
  GetAllProductsUseCase({required this.homeTabRepository});

  Future<Either<Failures, ProductResponseEntity>>  invoke(){
    return homeTabRepository.getAllProducts();
  }
}