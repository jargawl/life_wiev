import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_page_cubit.dart';
import 'apple_button.dart';
import 'facebook_button.dart';
import 'google_button.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<LoginPageCubit, LoginPageState>(
      builder: (context, state) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.all(
            0.05 * screenWidth,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white,
          child: Stack(
            children: [
              Container(
                alignment: const Alignment(0, -0.8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Sing Up',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    Text(
                      ' for free',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: const Alignment(0, -0.3),
                margin: EdgeInsets.symmetric(horizontal: 0.15 * screenWidth),
                child: Text(
                  'jakis teks ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Container(
                alignment: const Alignment(0, -0.05),
                child: const AppleButton(),
              ),
              Container(
                alignment: const Alignment(0, 0.15),
                child: const FacebookButton(),
              ),
              Container(
                alignment: const Alignment(0, 0.35),
                child: const GoogleButton(),
              ),
              // Container(
              //   alignment: const Alignment(0, 0.35),
              //   child: const EmailButton(),
              // ),
              Container(
                alignment: const Alignment(0, 0.9),
                margin: EdgeInsets.symmetric(horizontal: 0.15 * screenWidth),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'jakis tekst ',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'jakis teks ',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.blue,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Future<void> showLoginDialog(BuildContext context) async {
  await showDialog<dynamic>(
    context: context,
    useRootNavigator: false,
    builder: (context) => const LoginDialog(),
  );
}
