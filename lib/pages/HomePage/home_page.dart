import 'package:flutter/material.dart';
import 'package:life_wiev/widgets/EmotionCard/emotion_card.dart';
import 'package:life_wiev/widgets/LifeViewCard/life_view_card.dart';
import 'package:life_wiev/widgets/Topic/topic.dart';
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
              Topic('How do you feel today?'),
              EmotionGrid(),
              Topic('A place to think about yourself.'),
              LifeViewList(),
            ],
          ),
        ],
      ),
    );
  }
}
