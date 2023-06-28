import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view/view.dart';

class GoalsList extends StatelessWidget {
  const GoalsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => GoalsPage()),
        );
      },
      child: Container(
        width: screenWidth * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  'https://miro.medium.com/max/686/0*9rzGQRKC2kLHrD1M.png',
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Row(
              children: [
                SizedBox(
                  width: screenWidth * 0.03,
                ),
                Text(
                  "My goals",
                  style: GoogleFonts.wellfleet(
                    color: Colors.lightBlue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
