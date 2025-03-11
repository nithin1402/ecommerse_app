import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/remote/urls.dart';

import '../../../data/remote/api_helper.dart';
import 'create_order_event.dart';
import 'create_order_state.dart';


class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  ApiHelper apiHelper;
  CreateOrderBloc({required this.apiHelper}) : super(CreateOrderInitialState()) {
    on<CreateOrderEventStarted>((event, emit) async {
      emit(CreateOrderLoadingState());

      try{
        dynamic mData = await apiHelper.postApi(url: AppUrls.CREATE_ORDER_URL,bodyPrams: event.bodyParameters);
        if(mData["status"]){
          emit(CreateOrderLoadedState());
        }else{
          emit(CreateOrderErrorState(errorMsg: mData["message"]));
        }
      }catch(e){
        emit(CreateOrderErrorState(errorMsg: e.toString()));
      }

    });
  }
}
