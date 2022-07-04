import 'package:flutter/material.dart';
import 'package:life_wiev/models/LifeView/life_view_model.dart';
import 'package:life_wiev/pages/GratefulListPage/grateful_list_page.dart';

class LifeViewList extends StatelessWidget {
  const LifeViewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 500,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: lifeViews.length,
          itemBuilder: (context, index) {
            return LifeViewCard(
              lifeViews[index],
            );
          },
        ),
      ),
    );
  }
}

class LifeViewCard extends StatelessWidget {
  final LifeView lifeView;

  const LifeViewCard(this.lifeView, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) =>  GratefulPage(),
          ),
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
                  lifeView.image,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 10,
            ),
            Text(
              lifeView.title,
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
