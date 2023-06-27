import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../quotes_card /quotes_card.dart';
import '../widgets/widgets.dart';

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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: const [
              LogoBanner(),
              TopicInfo('How do you feel today?'),
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
