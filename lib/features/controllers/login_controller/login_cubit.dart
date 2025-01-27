import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield/features/controllers/login_controller/login_state.dart';
import 'package:pixelfield/features/data_repository/login_repo/login_repo.dart';
import 'package:pixelfield/features/models/user_model.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitial());

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  UserModel? loggedInUser;
  login() async {
    try {
      emit(LoginLoading());
      loggedInUser = await _loginRepo.login(UserModel(email: email.text,password: password.text).toJson());
      if(loggedInUser != null){
        emit(LoginLoaded(userModel: loggedInUser));
      }else{
        emit( LoginError(
          message: "Login failed available",
        ));
      }
    } catch (e) {
      emit( LoginError(
        message: e.toString(),
      ));
    }
  }

  validation(){
    if(email.text.isNotEmpty && password.text.isNotEmpty){
      return true;
    }
    return false;
  }


}