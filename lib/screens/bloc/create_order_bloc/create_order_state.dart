abstract class CreateOrderState {}

class CreateOrderInitialState extends CreateOrderState {}

class CreateOrderLoadingState extends CreateOrderState {}

class CreateOrderLoadedState extends CreateOrderState {}

class CreateOrderErrorState extends CreateOrderState {
  String errorMsg;
  CreateOrderErrorState({required this.errorMsg});
}