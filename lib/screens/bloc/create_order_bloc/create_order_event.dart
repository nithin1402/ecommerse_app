
abstract class CreateOrderEvent {}

class CreateOrderEventStarted extends CreateOrderEvent {
  Map<String,dynamic> bodyParameters;
  CreateOrderEventStarted({required this.bodyParameters});
}
