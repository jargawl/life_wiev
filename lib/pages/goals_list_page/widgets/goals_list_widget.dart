import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view/view.dart';

class GoalsList extends StatelessWidget {
  const GoalsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => GoalsPage()),
        );
      },
      child: Container(
        width: 300,
        height: 100,
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
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 15,
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
