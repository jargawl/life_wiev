import 'package:flutter/material.dart';
import 'package:life_wiev/pages/GratefulListPage/grateful_list_page.dart';

class GratefulList extends StatelessWidget {
  const GratefulList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => GratefulPage()),
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
                  "https://www.skipprichard.com/wp-content/uploads/2018/11/bigstock-Close-up-Of-Gratitude-Word-Wit-265169737.jpg",
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 10,
            ),
            Text(
              "My gratitude list",
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
