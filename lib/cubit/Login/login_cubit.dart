import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:rentak/Domain/Usecases/Renter/get_renter_usecase.dart';
// import 'package:rent_app/Domain/Usecases/renter_usecase.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final GetRenter getRenter;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late String email;
  late String password;
  late String emailError;
  late String passwordError;
  LoginCubit({required this.getRenter}) : super(LoginInitial());

  void initVariables() {
    email = emailController.text;
    password = passwordController.text;
    emailError = "";
    passwordError = "";
  }

  void login() async {
    emit(LoginInitial());
    initVariables();
    bool emailerror = false;
    bool passerror = false;

    if (!EmailValidator.validate(email)) {
      emailError = "Invalid Email Address";
      emailerror = true;
    }
    if (password.length < 8) {
      passwordError = "Please enter password at least 8 characters";
      passerror = true;
    }

    if (passerror || emailerror) {
      emit(
        LoginError(
            passError: passerror ? passwordError : null,
            emailError: emailerror ? emailError : null),
      );
    }

    if (EmailValidator.validate(email) && password.length >= 8) {
      // Perform your login/authentication logic here

      // try {
      //   final user =
      //       await getRenter(SignInParams(email: email, password: password));
      // } catch (serverFailure) {
      //   debugPrint("server error");

      emit(LoginLoading());

      return;
    }
  }
}
