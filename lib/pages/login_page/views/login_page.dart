import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/snackbars.dart';
import '../cubit/login_page_cubit.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const LoginPageBanner(),
          Text(
            isCreatingAccount == true ? 'Register' : 'Sign in',
            style: GoogleFonts.wellfleet(
              color: Colors.lightBlue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
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
            padding: const EdgeInsets.all(20.0),
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
            height: 20,
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
            height: 20,
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
          ]
        ],
      ),
    );
  }
}
