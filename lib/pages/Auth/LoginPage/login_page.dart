import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_wiev/pages/Auth/LoginPage/cubit/login_page_cubit.dart';

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
  var errorMesage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(isCreatingAccount == true
                  ? 'Zarejestruj się'
                  : 'Zaloguj się'),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'e-mail'),
                controller: widget.emailController,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'password'),
                controller: widget.passwordController,
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(errorMesage),
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
                              errorMesage = error.toString();
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
                              errorMesage = error.toString();
                            });
                          }
                          //logowanie
                        }
                      },
                      child: Text(isCreatingAccount == true
                          ? 'Zarejestruj się'
                          : 'Zaloguj się '),
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
                  child: const Text('Utwórz konto'),
                ),
              ],
              if (isCreatingAccount == true) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      isCreatingAccount = false;
                    });
                  },
                  child: const Text('Masz juz konto'),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
