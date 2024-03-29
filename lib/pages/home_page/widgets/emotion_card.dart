import 'package:flutter/material.dart';
import 'package:life_view/models/emotion_model.dart';

class EmotionCard extends StatefulWidget {
  const EmotionCard(this.emotion, {Key? key}) : super(key: key);
  final Emotion emotion;

  @override
  State<EmotionCard> createState() => EmotionCardState();
}

class EmotionCardState extends State<EmotionCard> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        incrementCounter();
      }),
      onLongPress: (() {
        resetCounter();
      }),
      child: Padding(
        padding: const EdgeInsets.all(12.5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.emotion.image,
                width: 59,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.emotion.title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$counter',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmotionGrid extends StatelessWidget {
  const EmotionGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 2.5 / 1,
        crossAxisCount: 2,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return EmotionCard(
            emotions[index],
          );
        },
        childCount: emotions.length,
      ),
    );
  }
}
