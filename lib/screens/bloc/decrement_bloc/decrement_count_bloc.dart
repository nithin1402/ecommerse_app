import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/remote/api_helper.dart';
import 'package:ecommerce_app/data/remote/urls.dart';

import 'decrement_count_event.dart';
import 'decrement_count_state.dart';

class DecrementCountBloc extends Bloc<DecrementCountEvent, DecrementCountState> {
  ApiHelper apiHelper;
  DecrementCountBloc({required this.apiHelper}) : super(DecrementCountInitialState()) {
    on<DecrementCountEvent>((event, emit) async{
      emit(DecrementCountLoadingState());

      try{
       var mData = await apiHelper.postApi(url: AppUrls.DECREMENT_COUNT_URL,bodyPrams: event.bodyParams);
       if(mData["status"]){
         emit(DecrementCountLoadedState(decrementCountData: mData));
       }else{
         emit(DecrementCountErrorState(errorMsg: mData["message"]));
       }
      }catch(e){
        emit(DecrementCountErrorState(errorMsg: e.toString()));
      }


    });

  }
}
