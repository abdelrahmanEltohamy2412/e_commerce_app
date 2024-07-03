import 'package:e_commerce_app/ui/home/tabs/product_list_tab/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListTabViewModel extends Cubit<ProductListTabState>{
  ProductListTabViewModel():super(ProductListTabInitialState());
}