import 'package:flutter/material.dart';

import '../view/view.dart';

class DreamList extends StatelessWidget {
  const DreamList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => DreamsPage()),
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
                  "https://miro.medium.com/max/500/1*lTVcNwigg8MEE-wHnHIYAQ.jpeg",
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 10,
            ),
            Text(
              "My dreams",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(.9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
