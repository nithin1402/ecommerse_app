import '../../../data/models/orders_model.dart';

abstract class GetOrderState {}

class GetOrderInitialState extends GetOrderState {}

class GetOrderLoadingState extends GetOrderState {}

class GetOrderLoadedState extends GetOrderState {
  GetOrderModel getOrderModel;
  GetOrderLoadedState({required this.getOrderModel});
}

class GetOrderErrorState extends GetOrderState {
  final String errorMsg;
  GetOrderErrorState({required this.errorMsg});
}