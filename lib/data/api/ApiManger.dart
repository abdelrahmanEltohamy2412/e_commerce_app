
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api/apiconstant.dart';
import 'package:e_commerce_app/data/model/request/LoginRequest.dart';
import 'package:e_commerce_app/data/model/request/RegisterRequest.dart';
import 'package:e_commerce_app/data/model/response/AddCartResponseDto.dart';
import 'package:e_commerce_app/data/model/response/CategoryOrBrandResponseDto.dart';
import 'package:e_commerce_app/data/model/response/GetCartResponseDto.dart';
import 'package:e_commerce_app/data/model/response/LoginResponseDto.dart';
import 'package:e_commerce_app/data/model/response/ProductResponseDto.dart';
import 'package:e_commerce_app/data/model/response/RegisterResponseDto.dart';
import 'package:e_commerce_app/domain/entities/failures.dart';
import 'package:e_commerce_app/ui/utils/shared_preference_utils.dart';
import 'package:http/http.dart' as http;
class ApiManger{
  ApiManger._();
 static ApiManger ? _instance;
 static getApiManger(){
   _instance??= ApiManger._();
   return _instance!;
 }
 /*
 https://ecommerce.routemisr.com/api/v1/auth/signup
  */
  Future <Either<Failures,RegisterResponseDto>>register
      (String name , String email, String password,String rePassword, String phone)async
  {

      Uri url =Uri.https(ApiConstant.baseUrl,ApiEndPoint.registerEndPoint);
      var registerRequestBody= RegisterRequest (
          email: email,
          name: name,
          password: password,
          rePassword: rePassword,
          phone: phone
      );
      var response=await http.post(url,body: registerRequestBody.toJson());
      var registerResponse=RegisterResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode>=200&& response.statusCode<300){
        return Right(registerResponse);
      }else {
        return Left(ServerError(
          errorMessage: registerResponse.errors != null ? registerResponse.errors!
              .msg! :
          registerResponse.message
          ,
        ));
      }


    }


     Future <Either<Failures,LoginResponseDto>>login
      ( String email, String password)async{

      Uri url =Uri.https(ApiConstant.baseUrl,ApiEndPoint.loginEndPoint);
      var loginRequestBody= LoginRequest(
        email: email
            ,
        password: password
      );
      var response=await http.post(url,body: loginRequestBody.toJson());
      var loginResponse=LoginResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode>=200&& response.statusCode<300){
        return Right(loginResponse);
      }else {
        return Left(ServerError(
          errorMessage:

          loginResponse.message
          ,
        ));
      }


    }



Future <Either<Failures,CategoryOrBrandResponseDto>>getCategories
    ( )async{

  Uri url =Uri.https(ApiConstant.baseUrl,ApiEndPoint.categoriesEndPoint);

  var response=await http.get(url,);
  var categoriesResponse=CategoryOrBrandResponseDto.fromJson(jsonDecode(response.body));
  if (response.statusCode>=200&& response.statusCode<300){
    return Right(categoriesResponse);
  }else {
    return Left(ServerError(
      errorMessage:

      categoriesResponse.message
      ,
    ));
  }


}

 Future <Either<Failures,CategoryOrBrandResponseDto>>getBrands
    ( )async{

  Uri url =Uri.https(ApiConstant.baseUrl,ApiEndPoint.brandsEndPoint);

  var response=await http.get(url,);
  var brandsResponse=CategoryOrBrandResponseDto.fromJson(jsonDecode(response.body));
  if (response.statusCode>=200&& response.statusCode<300){
    return Right(brandsResponse);
  }else {
    return Left(ServerError(
      errorMessage:

      brandsResponse.message
      ,
    ));
  }


}

Future <Either<Failures,ProductResponseDto>>getProducts
    ( )async{

  Uri url =Uri.https(ApiConstant.baseUrl,ApiEndPoint.productEndPoint);

  var response=await http.get(url);
  var productResponse=ProductResponseDto.fromJson(jsonDecode(response.body));
  if (response.statusCode>=200&& response.statusCode<300){
    return Right(productResponse);
  }else {
    return Left(ServerError(
      errorMessage:

      productResponse.message
      ,
    ));
  }


}

Future <Either<Failures,AddCartResponseDto>>addToCart( String productId)async {
  Uri url =Uri.https(ApiConstant.baseUrl,ApiEndPoint.addToCartEndPoint);
  var token =SharedPreferenceUtils.getData(key: 'Token');
  var response=await http.post(url,
      body:{'productId' :productId},
    headers: {
    'token' :token!.toString()
    }
  );
  var addCartResponse=AddCartResponseDto.fromJson(jsonDecode(response.body));
  if (response.statusCode>=200&& response.statusCode<300){
    return Right(addCartResponse);
  }else if(response.statusCode==401){
    return Left(ServerError(errorMessage: addCartResponse.message));
  }
  else
  {
    return Left(ServerError(
      errorMessage:

      addCartResponse.message
      ,
    )
    );
  }


}


Future <Either<Failures,GetCartResponseDto>>getCart()async {
  Uri url =Uri.https(ApiConstant.baseUrl,ApiEndPoint.addToCartEndPoint);
  var token =SharedPreferenceUtils.getData(key: 'Token');
  var response=await http.get(url,

    headers: {
    'token' :token!.toString()
    }
  );
  var getCartResponse=GetCartResponseDto.fromJson(jsonDecode(response.body));
  if (response.statusCode>=200&& response.statusCode<300){
    return Right(getCartResponse);
  }else if(response.statusCode==401){
    return Left(ServerError(errorMessage: getCartResponse.message));
  }
  else
  {
    return Left(ServerError(
      errorMessage:

      getCartResponse.message
      ,
    )
    );
  }


}


Future <Either<Failures,GetCartResponseDto>>deleteItemInCart(String productId)async {
  Uri url =Uri.https(ApiConstant.baseUrl,'${ApiEndPoint.addToCartEndPoint}/$productId');
  var token =SharedPreferenceUtils.getData(key: 'Token');
  var response=await http.delete(url,

    headers: {
    'token' :token!.toString()
    }
  );
  var deleteCartResponse=GetCartResponseDto.fromJson(jsonDecode(response.body));
  if (response.statusCode>=200&& response.statusCode<300){
    return Right(deleteCartResponse);
  }else if(response.statusCode==401){
    return Left(ServerError(errorMessage: deleteCartResponse.message));
  }
  else
  {
    return Left(ServerError(
      errorMessage:

      deleteCartResponse.message
      ,
    )
    );
  }


}



Future <Either<Failures,GetCartResponseDto>>updateItemInCart(int count,String productId)async {
  Uri url =Uri.https(ApiConstant.baseUrl,'${ApiEndPoint.addToCartEndPoint}/$productId');
  var token =SharedPreferenceUtils.getData(key: 'Token');
  var response=await http.put(url,
   body: {
    'count':count.toString()
   },
    headers: {
    'token' :token!.toString()
    }
  );
  var updateCartResponse=GetCartResponseDto.fromJson(jsonDecode(response.body));
  if (response.statusCode>=200&& response.statusCode<300){
    return Right(updateCartResponse);
  }else if(response.statusCode==401){
    return Left(ServerError(errorMessage: updateCartResponse.message));
  }
  else
  {
    return Left(ServerError(
      errorMessage:

      updateCartResponse.message
      ,
    )
    );
  }


}




  }

