import 'package:ecommerce_app/data/remote/urls.dart';
import 'package:ecommerce_app/screens/bloc/cart_bloc/cart_event.dart';
import 'package:ecommerce_app/screens/bloc/cart_bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/cart_model.dart';
import '../../../data/remote/api_helper.dart';

class CartBloc extends Bloc<CartEvent,CartState>{

  ApiHelper apiHelper;
  CartBloc({required this.apiHelper}) : super(CartInitialState()){

    on<FetchCartEvent>((event,emit) async{

      emit(CartLoadingState());

      try{
        var mData = await apiHelper.getApi(url: AppUrls.VIEW_CART_URL);
        if(mData["status"]){
          emit(CartLoadedState(cartData: CartModel.fromJson(mData).data));
        }else{
          emit(CartErrorState(errorMsg: mData["message"]));
        }

      }catch (e){
        emit(CartErrorState(errorMsg: e.toString()));
      }

    });

  }

}