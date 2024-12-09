import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInWithGoogle extends AuthEvent {}

class EmailChanged extends AuthEvent {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends AuthEvent {
  final String password;

  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class StartLogin extends AuthEvent {}

class SignUp extends AuthEvent {}

class LogOut extends AuthEvent {}

class ResetState extends AuthEvent {}
