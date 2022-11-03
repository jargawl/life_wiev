import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/snackbars.dart';

class TopicInfo extends StatefulWidget {
  final String text;
  const TopicInfo(this.text, {Key? key}) : super(key: key);

  @override
  State<TopicInfo> createState() => _TopicInfoState();
}

class _TopicInfoState extends State<TopicInfo> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0, left: 15.0),
        child: Row(
          children: [
            Text(
              widget.text,
              style: GoogleFonts.wellfleet(
                color: Colors.lightBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 0.33 * screenWidth),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(MySnackBars.successSnackBar);
              },
              child: const Icon(
                Icons.info,
                color: Colors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
