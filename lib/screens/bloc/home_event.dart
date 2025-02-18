abstract class HomeEvent{}

class RegisterUserEvent extends HomeEvent{
  Map<String,dynamic> bodyPrams;
  RegisterUserEvent({required this.bodyPrams});
}