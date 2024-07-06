import 'package:e_commerce_app/data/model/response/CategoryOrBrandResponseDto.dart';
import 'package:e_commerce_app/data/model/response/ProductResponseDto.dart';
import 'package:e_commerce_app/domain/entities/GetCardRsponseEntity.dart';
import 'package:e_commerce_app/domain/entities/ProducResponseEntity.dart';

class GetCartResponseDto extends GetCardResponseEntity{
  GetCartResponseDto({
      super.status,
      super.numOfCartItems,
      super.data,
    this.statusMsg,
  this.message});

  GetCartResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? GetCartDataDto.fromJson(json['data']) : null;
  }

  String? message;
  String? statusMsg;


}

class GetCartDataDto extends GetDataCartEntity {
  GetCartDataDto({
      super.id,
      super.cartOwner,
      super.products,
      super.createdAt,
      super.updatedAt,
      super.v,
      super.totalCartPrice,});

  GetCartDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetProductCartDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }






}

class GetProductCartDto extends GetProductCartEntity {
  GetProductCartDto({
      super.count,
      super.id,
      super.product,
      super.price,});

  GetProductCartDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null ? GetProductDto.fromJson(json['product']) : null;
    price = json['price'];
  }




}

class GetProductDto extends GetProductEntity {
  GetProductDto({
      super.subcategory,
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
      });

  GetProductDto.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDto.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? CategoryOrBrandDto.fromJson(json['category']) : null;
    brand = json['brand'] != null ? CategoryOrBrandDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }




}

