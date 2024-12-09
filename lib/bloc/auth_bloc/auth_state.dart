import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final String email;
  final String password;
  final String name;
  final bool emailValid;
  final bool passwordValid;
  final bool userSignUp;
  final bool userLoggedIn;
  final bool userAuthenticationStatus;

  const AuthState({
    required this.email,
    required this.password,
    required this.name,
    required this.emailValid,
    required this.passwordValid,
    required this.userSignUp,
    required this.userLoggedIn,
    required this.userAuthenticationStatus,
  });

  factory AuthState.initial() {
    return const AuthState(
        email: '',
        password: '',
        name: '',
        emailValid: false,
        passwordValid: false,
        userSignUp: false,
        userLoggedIn: false,
        userAuthenticationStatus: false);
  }

  AuthState copyWith({
    String? email,
    String? password,
    String? name,
    bool? emailValid,
    bool? passwordValid,
    bool? userSignUp,
    bool? userLoggedIn,
    bool? userAuthenticationStatus,
  }) {
    return AuthState(
        email: email ?? this.email,
        password: password ?? this.password,
        name: name ?? this.name,
        emailValid: emailValid ?? this.emailValid,
        passwordValid: passwordValid ?? this.passwordValid,
        userSignUp: userSignUp ?? this.userSignUp,
        userLoggedIn: userLoggedIn ?? this.userLoggedIn,
        userAuthenticationStatus: userAuthenticationStatus ?? this.userAuthenticationStatus
    );
  }

  bool get isLoginFormValid => emailValid && passwordValid;

  bool get isSignUpFormValid => emailValid && passwordValid && name.isNotEmpty;

  @override
  List<Object?> get props => [
    email,
    password,
    name,
    emailValid,
    passwordValid,
    userSignUp,
    userLoggedIn,
    userAuthenticationStatus,
  ];
}
