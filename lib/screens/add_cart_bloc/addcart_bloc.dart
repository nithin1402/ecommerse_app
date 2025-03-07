import 'package:ecommerce_app/data/remote/urls.dart';
import 'package:ecommerce_app/screens/add_cart_bloc/addcart_event.dart';
import 'package:ecommerce_app/screens/add_cart_bloc/addcart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/remote/api_helper.dart';

class AddcartBloc extends Bloc<AddcartEvent,AddcartState>{

  ApiHelper apiHelper;
  AddcartBloc({required this.apiHelper}) : super(AddcartInitialState()){
    on<AddToCartEvent>((event,emit) async{
      emit(AddcartLoadingState());

      try{
        var data= await apiHelper.postApi(url: AppUrls.ADD_CART_URL,bodyPrams: event.mParams);
        if((data["status"] is String && data["status"] == "true") ||
            (data["status"] is bool && data["status"] == "true")){
          emit(AddcartLoadedState());
        }else{
          emit(AddcartErrorState(errorMsg:data["message"]));
        }
      }catch (e){
        emit(AddcartErrorState(errorMsg: e.toString()));
      }

    });
  }
}