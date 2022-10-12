import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:life_view/pages/home_page/widgets/emotion_card.dart';
import 'package:life_view/pages/home_page/widgets/fade_app_bar.dart';
import 'package:life_view/pages/home_page/widgets/life_view_card.dart';
import 'package:life_view/pages/home_page/widgets/log_out_button.dart';
import 'package:life_view/pages/home_page/widgets/topic.dart';
import 'package:life_view/pages/home_page/widgets/logo_banner.dart';
import 'package:life_view/pages/home_page/widgets/topic_small.dart';
import '../../quotes_card /quotes_card.dart';

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
              QuotesCardList(),
              SingOutButton(),
            ],
          ),
          FadeAppBar(scrollOffset: _scrollControllerOffset)
        ],
      ),
    );
  }
}
