abstract class DecrementCount{}

class DecrementCountEvent extends DecrementCount{
  Map<String,dynamic> bodyParams;
  DecrementCountEvent({required this.bodyParams});
}