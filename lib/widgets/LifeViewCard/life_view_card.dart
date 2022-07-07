import 'package:flutter/material.dart';
import 'package:life_wiev/widgets/DreamListWidget/dream_list_widget.dart';
import 'package:life_wiev/widgets/GoalsListWidget/goals_list_widget.dart';
import 'package:life_wiev/widgets/GratefulListWidget/grateful_list_widget.dart';

class LifeViewList extends StatelessWidget {
  const LifeViewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 500,
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
