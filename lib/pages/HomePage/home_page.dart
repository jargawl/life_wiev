import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:life_wiev/widgets/EmotionCard/emotion_card.dart';
import 'package:life_wiev/widgets/FadeAppBar/fade_app_bar.dart';
import 'package:life_wiev/widgets/LifeViewCard/life_view_card.dart';
import 'package:life_wiev/widgets/LogOutButton/log_out_button.dart';
import 'package:life_wiev/widgets/Topic/topic.dart';
import 'package:life_wiev/widgets/LogoBanner/logo_banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

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
              EmotionGrid(),
              SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
              Topic('A place to think about yourself.'),
              LifeViewList(),
              SingOutButton(),
            ],
          ),
          FadeAppBar(scrollOffset: _scrollControllerOffset)
        ],
      ),
    );
  }
}
