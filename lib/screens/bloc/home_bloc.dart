import 'package:ecommerce_app/data/repository/app_repository.dart';
import 'package:ecommerce_app/screens/bloc/home_event.dart';
import 'package:ecommerce_app/screens/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{

  AppRepository appRepository;
  HomeBloc({required this.appRepository}) : super(HomeInitialState()){

    on<RegisterUserEvent>((event,emit) async{
      emit(HomeLoadingState());

      try{
        var data = await appRepository.registerUser(bodyParameters: event.bodyPrams);
        print(data);
        if(data["status"]){
          emit(HomeLoadedState());
        }else{
          emit(HomeErrorState(errorMsg: "${data["message"]}"));
        }
      }catch (e){
        emit(HomeErrorState(errorMsg: e.toString()));
      }
    });

  }

}