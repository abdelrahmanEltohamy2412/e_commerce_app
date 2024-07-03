import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/ApiManger.dart';
import 'package:e_commerce_app/domain/entities/AddCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/ProducResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/domain/repository/data_source/home_tab_remote_dataSource.dart';

class HomeTabRemoteDataSourceImpl implements HomeTabRemoteDatasource
{
  ApiManger apiManger;
  HomeTabRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories()async {
    var either = await apiManger.getCategories();
   return either.fold((l){
     return Left(l);
   }, (response){
     return Right(response);
   });

  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrands() async{
    var either = await apiManger.getBrands();
    return either.fold((l){
      return Left(l);
    }, (response){
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async{
    var either = await apiManger.getProducts();
    return either.fold((l){return Left(l); }, (response){return Right(response);});
  }

  @override
  Future<Either<Failures, AddCartResponseEntity>> addProducts(String productId)async {
    var either = await apiManger.addToCart(productId);
    return either.fold((l){return Left(l); }, (response){return Right(response);});
  }

}