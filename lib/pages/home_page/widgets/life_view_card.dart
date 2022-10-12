import 'package:flutter/material.dart';
import 'package:life_view/pages/dreams_list_page/widgets/dream_list_widget.dart';
import 'package:life_view/pages/goals_list_page/widgets/goals_list_widget.dart';
import 'package:life_view/pages/grateful_list_page/widgets/grateful_list_widget.dart';

class LifeViewList extends StatelessWidget {
  const LifeViewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 250,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            GratefulList(),
            GoalsList(),
            DreamList(),
          ],
        ),
      ),
    );
  }
}
