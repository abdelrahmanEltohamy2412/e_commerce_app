import 'package:e_commerce_app/data/api/ApiManger.dart';
import 'package:e_commerce_app/data/repository/data_source/auth_remote_data_source_imp.dart';
import 'package:e_commerce_app/data/repository/data_source/home_tab_remote_data_source_impl.dart';
import 'package:e_commerce_app/data/repository/repository/auth_repo_imp.dart';
import 'package:e_commerce_app/data/repository/repository/home_tab_repository_impl.dart';
import 'package:e_commerce_app/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/repository/data_source/home_tab_remote_dataSource.dart';
import 'package:e_commerce_app/domain/repository/repository/auth_repo.dart';
import 'package:e_commerce_app/domain/repository/repository/home_tab_repository.dart';
import 'package:e_commerce_app/domain/use_case/Add_cart_use_use_Case.dart';
import 'package:e_commerce_app/domain/use_case/get_all_Brands_useCase.dart';
import 'package:e_commerce_app/domain/use_case/get_all_categories_useCase.dart';
import 'package:e_commerce_app/domain/use_case/get_all_product_use_case.dart';
import 'package:e_commerce_app/domain/use_case/login_use_case.dart';
import 'package:e_commerce_app/domain/use_case/register_use_case.dart';

injectRegisterUseCase(){
  return RegisterUseCase(authRepository: injectAuthRepository());
}
LoginUseCase injectLoginUseCase (){
   return LoginUseCase(authRepository: injectAuthRepository());
}
GetAllCategoriesUseCase injectGatAllCategoriesUseCase (){
   return GetAllCategoriesUseCase(homeTabRepository: injectHomeTabRepository());
}
GetAllBrandsUseCase injectGetAllBrandsUseCase (){
   return GetAllBrandsUseCase(homeTabRepository: injectHomeTabRepository());
}
GetAllProductsUseCase injectGetAllProductsUseCase(){
  return GetAllProductsUseCase(homeTabRepository: injectHomeTabRepository());
}
AddCArtUseCase injectAddCArtUseCase(){
  return AddCArtUseCase(homeTabRepository: injectHomeTabRepository());
}
HomeRepository injectHomeTabRepository(){
   return HomeTabRepositoryImpl(homeTabRemoteDatasource: injectHomeTabRemoteDatasource());
}
  HomeTabRemoteDatasource injectHomeTabRemoteDatasource(){
  return HomeTabRemoteDataSourceImpl(apiManger: ApiManger.getApiManger());
}
AuthRepository  injectAuthRepository(){
   return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource(){
   return AuthRemoteDataSourceImp(apiManger: ApiManger.getApiManger());
}

injectApiManger(){

}

