import 'package:flutter/material.dart';
import 'package:life_wiev/models/EmotionModel/emotion_model.dart';

class LiveViewList extends StatelessWidget {
  const LiveViewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 500,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: emotions.length,
          itemBuilder: (context, index) {
            return LiveViewCard();
          },
        ),
      ),
    );
  }
}
