
import 'package:pixelfield/features/models/user_model.dart';

class LoginState  {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final UserModel? userModel;
  LoginLoaded({required this.userModel,});

}

class LoginError extends LoginState {
  final String message;
  LoginError({required this.message,});

}
