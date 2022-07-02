import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmotionPalet extends StatelessWidget {
  final String text;
  const EmotionPalet(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0, left: 15.0),
        child: Text(
          text,
          style: GoogleFonts.wellfleet(
            color: Colors.lightBlue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
