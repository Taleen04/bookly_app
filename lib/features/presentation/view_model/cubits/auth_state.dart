abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSucceed extends RegisterState {}

class RegisterFailed extends RegisterState {}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucceed extends LoginState {}

class LoginFailed extends LoginState {}
