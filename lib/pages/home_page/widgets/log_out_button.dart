import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../login_page/cubit/login_page_cubit.dart';

class SingOutButton extends StatelessWidget {
  const SingOutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (context) => LoginPageCubit(),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(5),
            alignment: Alignment.center,
            padding: MaterialStateProperty.all(const EdgeInsets.only(
                right: 50, left: 50, top: 12.5, bottom: 5.5)),
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 197, 229, 244),
            ),
            overlayColor: MaterialStateProperty.resolveWith(
              (states) {
                return states.contains(MaterialState.pressed)
                    ? Colors.lightBlue
                    : null;
              },
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          onPressed: () {
            context.read<LoginPageCubit>().singOut();
          },
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.blue, Colors.lightBlue],
            ).createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(
              'Logout',
              style: GoogleFonts.wellfleet(
                color: Colors.lightBlue,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
