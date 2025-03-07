import 'package:ecommerce_app/data/models/product_model.dart';

abstract class ProductState{}

class ProductInitialState extends ProductState{}
class ProductLoadingState extends ProductState{}
class ProductLoadedState extends ProductState{
  List<DataModel> mProducts;
  ProductLoadedState({required this.mProducts});
}
class ProductErrorState extends ProductState{
  String errorMsg;
  ProductErrorState({required this.errorMsg});
}