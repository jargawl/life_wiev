import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:life_wiev/widgets/EmotionCard/emotion_card.dart';
import 'package:life_wiev/widgets/FadeAppBar/fade_app_bar.dart';
import 'package:life_wiev/widgets/LifeViewCardList/life_view_card.dart';
import 'package:life_wiev/widgets/LogOutButton/log_out_button.dart';
import 'package:life_wiev/widgets/QuotesCard/quotes_card.dart';
import 'package:life_wiev/widgets/Topic/topic.dart';
import 'package:life_wiev/widgets/LogoBanner/logo_banner.dart';
import 'package:life_wiev/widgets/TopicSmall/topic_small.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

  _HomePageState();

  void _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: const [
              LogoBanner(),
              Topic('How do you feel today?'),
              TopicSmall('Press emoticons to count your emotions.'),
              EmotionGrid(),
              SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
              Topic('A place to think about yourself.'),
              LifeViewList(),
              Topic('Catch some motivation !'),
              QoutesCardList(),
              SingOutButton(),
            ],
          ),
          FadeAppBar(scrollOffset: _scrollControllerOffset)
        ],
      ),
    );
  }
}
