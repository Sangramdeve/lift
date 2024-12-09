import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lift/bloc/auth_bloc/auth_bloc.dart';
import 'package:lift/bloc/auth_bloc/auth_event.dart';
import 'package:lift/bloc/auth_bloc/auth_state.dart';
import 'package:lift/ui/auth_layouts/widgets/custom_button.dart';

import '../../route/route_name.dart';

class Login extends StatelessWidget {
  const Login({super.key});



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state.userAuthenticationStatus) {
                    Navigator.pushReplacementNamed(
                        context, routeName.permissionScreen);
                  }
                },
                child: Column(
                  children: [
                    const SizedBox(height: 32.0),
                    const Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Please login to your account',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32.0),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return TextField(
                          //controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                            errorText: state.emailValid
                                ? null
                                : 'Please enter a valid email',
                            border: OutlineInputBorder(
                              // Set the border to an outline
                              borderRadius: BorderRadius.circular(10.0),
                              // Rounded border
                              borderSide: const BorderSide(
                                color: Colors.blue, // Border color
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                // Border color when enabled
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.blueAccent,
                                // Border color when focused
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white, // Set the background color
                          ),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          onChanged: (value) => context
                              .read<AuthBloc>()
                              .add(EmailChanged(email: value)),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return TextField(

                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                            errorText: state.passwordValid
                                ? null
                                : 'Password must be at least 6 characters long',
                            border: OutlineInputBorder(
                              // Set the border to an outline
                              borderRadius: BorderRadius.circular(10.0),
                              // Rounded border
                              borderSide: const BorderSide(
                                color: Colors.blue, // Border color
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                // Border color when enabled
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.blueAccent,
                                // Border color when focused
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white, // Set the background color
                          ),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          onChanged: (value) => context
                              .read<AuthBloc>()
                              .add(PasswordChanged(password: value)),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: state.isLoginFormValid
                            ? Colors.blueAccent
                            : Colors.grey,
                        minimumSize: Size(screenWidth / 4, 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.grey.shade300),
                        )),
                    onPressed: () {
                      if (state.isLoginFormValid) {
                        context.read<AuthBloc>().add(StartLogin());
                      }
                    },
                    child: const Text('Login'));
              },
            ),
            TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                    minimumSize: Size(screenWidth / 4, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.grey.shade300),
                    )),
                onPressed: () {
                  context.read<AuthBloc>().add(ResetState());
                  Navigator.pushNamed(context, routeName.signupScreen);
                },
                child: const Text('Create a new Account')),
            const Spacer(),
            CustomButtons(
              text: 'sign in with Google',
              onTap: () {
                context.read<AuthBloc>().add(SignInWithGoogle());
              },
              iconUrl: 'assets/ic_google.png',
            ),
            Column(
              children: [
                const Text(
                  'By continuing, you agree to our ',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        /* Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WebViewPage()),
                      );*/
                      },
                      child: const Text(
                        'Terms of Use',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const Text(
                      ' and ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        /* Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => privacyPolicy()),
                      );*/
                      },
                      child: const Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                  indent: 32,
                  endIndent: 32,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
