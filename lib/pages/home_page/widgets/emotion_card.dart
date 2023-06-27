import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:life_view/models/emotion_model.dart';

class EmotionCard extends StatefulWidget {
  const EmotionCard(this.emotion, {Key? key}) : super(key: key);
  final Emotion emotion;

  @override
  State<EmotionCard> createState() => EmotionCardState();
}

class EmotionCardState extends State<EmotionCard> {
  late Future<SharedPreferences> _prefs;
  late String _counterKey;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    _prefs = SharedPreferences.getInstance();
    _counterKey = 'counter_${widget.emotion.title}';
    loadCounter();
  }

  void loadCounter() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      counter = prefs.getInt(_counterKey) ?? 0;
    });
  }

  void saveCounter() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt(_counterKey, counter);
  }

  void incrementCounter() {
    setState(() {
      counter++;
      saveCounter();
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
      saveCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        incrementCounter();
      },
      onLongPress: () {
        resetCounter();
      },
      child: Padding(
        padding: const EdgeInsets.all(12.5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.emotion.image,
                width: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.emotion.title,
                    style: GoogleFonts.wellfleet(
                      color: Colors.lightBlue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$counter',
                    style: GoogleFonts.wellfleet(
                      color: Colors.lightBlue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
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
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 50.0,
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
