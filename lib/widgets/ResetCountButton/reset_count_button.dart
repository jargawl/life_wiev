import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetCount extends StatelessWidget {
  const ResetCount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(5),
            alignment: Alignment.center,
            padding: MaterialStateProperty.all(const EdgeInsets.only(
                right: 50, left: 50, top: 12.5, bottom: 12.5)),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromARGB(255, 197, 229, 244)),
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
          onPressed: () {},
          child: ShaderMask(
            shaderCallback: (bounds) =>
                const LinearGradient(colors: [Colors.blue, Colors.lightBlue])
                    .createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(
              'Reset yours emotion counter',
              textAlign: TextAlign.center,
              style: GoogleFonts.wellfleet(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
