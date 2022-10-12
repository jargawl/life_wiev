import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageBanner extends StatelessWidget {
  const LoginPageBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.1,
      child: Stack(
        children: [
          Image.network(
            "https://images.photowall.com/products/60742/palm-trees-on-white-beach.jpg?h=699&q=85",
            fit: BoxFit.cover,
            height: 350,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Life',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.wellfleet(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
                Text(
                  'View',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.wellfleet(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
