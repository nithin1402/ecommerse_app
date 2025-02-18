abstract class HomeState{}

class HomeInitialState extends HomeState{}

class HomeLoadedState extends HomeState{}

class HomeLoadingState extends HomeState{}

class HomeErrorState extends HomeState{
  String errorMsg;
  HomeErrorState({required this.errorMsg});
}