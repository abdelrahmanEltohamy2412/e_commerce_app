import 'package:e_commerce_app/domain/use_case/login_use_case.dart';
import 'package:e_commerce_app/ui/auth/login/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenViewModel extends Cubit<LoginStates>{
  LoginScreenViewModel({required this.loginUseCase}):super (LoginInitialState());
  LoginUseCase loginUseCase;

  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  bool isObscure = true;
 void login()async{
   emit(LoginLoadingState());
  var either= await loginUseCase.invoke(emailController.text, passwordController.text);
  either.fold((l){emit(LoginErrorState(errorMessage: l.errorMessage));}, (r){
     emit(LoginSuccessState(authResultEntity: r));
  });
  }
}