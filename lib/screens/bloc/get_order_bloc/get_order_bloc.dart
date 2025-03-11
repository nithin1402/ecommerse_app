import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/remote/app_exception.dart';

import '../../../data/models/orders_model.dart';
import '../../../data/remote/api_helper.dart';
import '../../../data/remote/urls.dart';
import 'get_order_event.dart';
import 'get_order_state.dart';


class GetOrderBloc extends Bloc<GetOrderEvent, GetOrderState> {
  ApiHelper apiHelper;
  GetOrderBloc({required this.apiHelper}) : super(GetOrderInitialState()) {
    on<FetchOrderEvent>((event, emit) async{
     emit(GetOrderLoadingState());

     try{
       dynamic mData = await apiHelper.postApi(url: AppUrls.GET_ORDER_URL);
       if(mData["status"]){
         emit(GetOrderLoadedState(getOrderModel: GetOrderModel.fromJson(mData)));
       }else{
         emit(GetOrderErrorState(errorMsg: mData["message"]));
       }
     }catch(e){
       emit(GetOrderErrorState(errorMsg: (e as AppException).toErrorMsg()));

    }});
  }
}
