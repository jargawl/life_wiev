import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetCount extends StatefulWidget {
  const ResetCount({Key? key}) : super(key: key);

  @override
  State<ResetCount> createState() => _ResetCountState();
}

class _ResetCountState extends State<ResetCount> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(5),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(
            const EdgeInsets.only(right: 50, left: 50, top: 12.5, bottom: 12.5),
          ),
          backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 219, 243, 255),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
          overlayColor: MaterialStateProperty.resolveWith(
            (states) {
              return states.contains(MaterialState.pressed)
                  ? Colors.white
                  : null;
            },
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
            'Tap to reset your emotions counter',
            textAlign: TextAlign.center,
            style: GoogleFonts.wellfleet(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
