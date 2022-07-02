import 'package:flutter/material.dart';
import 'package:life_wiev/widgets/EmotionCard/emotion_card.dart';

import 'package:life_wiev/widgets/EmotionPalet/emotion_palet.dart';
import 'package:life_wiev/widgets/LogoBanner/logo_banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          CustomScrollView(
            slivers: [
              LogoBanner(),
              EmotionPalet('How do you feel today?'),
              EmotionGrid(),
            ],
          ),
        ],
      ),
    );
  }
}
