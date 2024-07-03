import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/repository/data_source/home_tab_remote_dataSource.dart';
import 'package:e_commerce_app/domain/repository/repository/home_tab_repository.dart';

class HomeTabRepositoryImpl implements HomeTabRepository{
  HomeTabRemoteDatasource homeTabRemoteDatasource ;
  HomeTabRepositoryImpl({required this.homeTabRemoteDatasource});
  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories() {
    return homeTabRemoteDatasource.getAllCategories();
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() {
    return homeTabRemoteDatasource.getBrands();
  }

}