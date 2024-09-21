import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_project/auth/register/cubit/register_state.dart';
import 'package:route_project/data/api_manager.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

//hold data handle logic

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController(text: 'Shahd');
  var passwordController = TextEditingController(text: '123456');
  var confirmationPasswordController = TextEditingController(text: '123456');
  var emailController = TextEditingController(text: 'shahd@route.com');
  var phoneController = TextEditingController(text: '01010101010');
  bool isObscure = true;

  void register() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(RegisterLoadingState());
        var response = await ApiManager.register(
            emailController.text,
            nameController.text,
            phoneController.text,
            passwordController.text,
            confirmationPasswordController.text);
        if (response.statusMsg == 'fail') {
          emit(RegisterErrorState(errorMessage: response.message!));
        } else {
          emit(RegisterSucessState(response: response));
        }
      } catch (e) {
        emit(RegisterErrorState(errorMessage: e.toString()));
      }
    }
  }
}
