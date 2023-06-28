import 'package:flutter/material.dart';

class AppleButton extends StatelessWidget {
  const AppleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: () {
        // context.read<LoginPageCubit>().logInWithApple();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.black,
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
              IconData(0xf04be, fontFamily: 'MaterialIcons'),
              size: 24,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(
              'Login with Apple',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
