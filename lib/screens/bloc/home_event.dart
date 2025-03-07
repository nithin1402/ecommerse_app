abstract class HomeEvent{}

class RegisterUserEvent extends HomeEvent{
  Map<String,dynamic> bodyPrams;
  RegisterUserEvent({required this.bodyPrams});
}

class LoginUserEvent extends HomeEvent{
  Map<String,dynamic> bodyPrams;
  LoginUserEvent({required this.bodyPrams});
}