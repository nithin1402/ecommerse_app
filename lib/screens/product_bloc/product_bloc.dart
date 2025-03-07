import 'package:ecommerce_app/data/models/product_model.dart';
import 'package:ecommerce_app/data/remote/app_exception.dart';
import 'package:ecommerce_app/data/remote/urls.dart';
import 'package:ecommerce_app/screens/product_bloc/product_event.dart';
import 'package:ecommerce_app/screens/product_bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/remote/api_helper.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{

  ApiHelper apiHelper;
  ProductBloc({required this.apiHelper}) : super(ProductInitialState()){
    on<FetchProductEvent>((event,emit) async{
      emit(ProductLoadingState());
      
      try{
        dynamic mData = await apiHelper.postApi(url: AppUrls.PRODUCT_URL);
        if(mData["status"]){
        emit(ProductLoadedState(mProducts: ProductModel.fromJson(mData).data));
        }else{
          emit(ProductErrorState(errorMsg: mData["message"]));
        }
      }catch (e){
        emit(ProductErrorState(errorMsg:(e as AppException).toErrorMsg()));
      }
      
    });
  }

}