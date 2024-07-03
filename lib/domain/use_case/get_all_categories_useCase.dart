
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repository/repository/home_tab_repository.dart';

import '../entities/CategoryOrBrandResponseEntity.dart';
import '../entities/failures.dart';

class GetAllCategoriesUseCase{
HomeTabRepository homeTabRepository;
GetAllCategoriesUseCase({required this.homeTabRepository});

Future<Either<Failures, CategoryOrBrandResponseEntity>>  invoke(){
   return homeTabRepository.getAllCategories();
  }
}