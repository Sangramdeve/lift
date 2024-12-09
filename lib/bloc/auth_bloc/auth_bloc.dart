import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lift/bloc/auth_bloc/auth_event.dart';
import 'package:lift/bloc/auth_bloc/auth_state.dart';
import 'package:lift/bloc/repositories/repositories.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final BlocRepositories repositories;

  AuthBloc(this.repositories) : super(AuthState.initial()) {

    on<ResetState>((event, emit) {
      emit(AuthState.initial());
    });

    on<SignInWithGoogle>((event, emit) async {
      User? user = await repositories.userCredential();
      if (user != null) {

        emit(state.copyWith(
            userAuthenticationStatus: true
        ));
      } else {
        emit(state.copyWith(
            userAuthenticationStatus: false
        ));
      }
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
          email: event.email,
          emailValid: _validateEmail(event.email),
      ));
    });

    on<PasswordChanged>((event, emit) {
      final isValid = _validatePassword(event.password);
      emit(state.copyWith(
        password: event.password,
        passwordValid: isValid,
      ));
    });


    on<StartLogin>((event, emit) {

      Map<String,dynamic> userCreed = {
        'email' : state.email,
        'password': state.password,
      };

      if(state.isLoginFormValid){
        repositories.loginNewUser(userCreed);
        print('Password Changed: $userCreed'); // Debugging
      }
    });

    on<SignUp>((event, emit) {

    });

    on<LogOut>((event, emit) {

    });
  }



  bool _validateEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  bool _validatePassword(String password) {
    if ( password.length < 6) {
      return false;
    }else{
      return true;
    }
  }
}