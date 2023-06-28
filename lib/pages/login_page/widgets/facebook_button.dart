import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_view/pages/login_page/cubit/login_page_cubit.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<LoginPageCubit, LoginPageState>(
      builder: (context, appState) {
        return ElevatedButton(
          onPressed: () {
            // context.read<LoginPageCubit>().logInWithFacebook();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.orange,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          child: SizedBox(
            width: 0.6 * screenWidth,
            height: 40,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  IconData(0xe255, fontFamily: 'MaterialIcons'),
                  size: 24,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Text(
                  'Login with Facebook ',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
