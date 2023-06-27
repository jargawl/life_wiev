import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_view/pages/login_page/views/forgot_password_page.dart';

import '../../../widgets/snackbars.dart';
import '../login_page.dart';

class LoginBody extends StatefulWidget {
  LoginBody({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  var errorMessage = '';
  var isCreatingAccount = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Text(
            isCreatingAccount == true ? 'Register' : 'Sign in',
            style: GoogleFonts.wellfleet(
              color: Colors.lightBlue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'e-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
              controller: widget.emailController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
              controller: widget.passwordController,
              obscureText: true,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          BlocProvider(
            create: (context) => LoginPageCubit(),
            child: BlocBuilder<LoginPageCubit, LoginPageState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () async {
                    if (isCreatingAccount == true) {
                      try {
                        await context
                            .read<LoginPageCubit>()
                            .createUserWithEmailAndPassword(
                                email: widget.emailController.text,
                                password: widget.passwordController.text);
                      } catch (error) {
                        setState(() {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(MySnackBars.failureSnackBar);
                        });
                      }

                      // rejestracja
                    } else {
                      try {
                        await context
                            .read<LoginPageCubit>()
                            .signInWithEmailAndPassword(
                              email: widget.emailController.text,
                              password: widget.passwordController.text,
                            );
                      } catch (error) {
                        setState(() {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(MySnackBars.failureSnackBar);
                        });
                      }
                      //logowanie
                    }
                  },
                  child: Text(
                    isCreatingAccount == true ? 'Register' : 'Sign in ',
                    style: GoogleFonts.wellfleet(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          if (isCreatingAccount == false) ...[
            TextButton(
              onPressed: () {
                setState(() {
                  isCreatingAccount = true;
                });
              },
              child: Text(
                'Create an account',
                style: GoogleFonts.wellfleet(
                  color: Colors.lightBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const ForgotPasswordPage()));
              },
              child: Text(
                'Forgot your password?',
                style: GoogleFonts.wellfleet(
                  color: Colors.lightBlue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          if (isCreatingAccount == true) ...[
            TextButton(
              onPressed: () {
                setState(() {
                  isCreatingAccount = false;
                });
              },
              child: Text(
                'Do you already have an account?',
                style: GoogleFonts.wellfleet(
                  color: Colors.lightBlue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
