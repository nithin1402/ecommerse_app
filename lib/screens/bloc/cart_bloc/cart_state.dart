import '../../../data/models/cart_model.dart';

abstract class CartState{}

class CartInitialState extends CartState{}
class CartLoadingState extends CartState{}
class CartLoadedState extends CartState{
  List<CartDataModel> cartData;
  CartLoadedState({required this.cartData});
}
class CartErrorState extends CartState{
  String errorMsg;
  CartErrorState({required this.errorMsg});
}