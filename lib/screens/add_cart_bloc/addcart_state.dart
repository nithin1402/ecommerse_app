abstract class AddcartState{}

class AddcartInitialState extends AddcartState{}
class AddcartLoadingState extends AddcartState{}
class AddcartLoadedState extends AddcartState{}
class AddcartErrorState extends AddcartState{
  String errorMsg;
  AddcartErrorState({required this.errorMsg});
}