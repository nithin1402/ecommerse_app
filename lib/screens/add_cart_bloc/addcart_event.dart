abstract class AddcartEvent{}

class AddToCartEvent extends AddcartEvent{
  Map<String,dynamic> mParams;
  AddToCartEvent({required this.mParams});
}