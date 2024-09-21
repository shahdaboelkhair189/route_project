import 'package:route_project/data/model/response/RegisterResponse.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  String errorMessage;

  RegisterErrorState({required this.errorMessage});
}

class RegisterSucessState extends RegisterStates {
  RegisterResponse response;

  RegisterSucessState({required this.response});
}
