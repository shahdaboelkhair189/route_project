import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_project/home/cubit/login_states.dart';

import '../../data/api_manager.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

//hold data handle logic

  final TextEditingController emailController =
      TextEditingController(text: 'shahd@route.com');
  final TextEditingController passwordController =
      TextEditingController(text: '123456');
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObscure = true;

  void login() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(LoginLoadingState());
        var response = await ApiManager.Login(
          emailController.text,
          passwordController.text,
        );
        if (response.statusMsg == 'fail') {
          emit(LoginErrorState(errorMessage: response.message!));
          print('message:${response.message}');
        } else {
          emit(LoginSuccessState(response: response));
          print('message:${response.token}');
        }
      } catch (e) {
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    }
  }
}
