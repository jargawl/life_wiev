import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_wiev/core/enums/enums.dart';
import 'package:life_wiev/models/QuotesModel/quotes_model.dart';
import 'package:life_wiev/services/Data/DataSources/motivation_quotes_data_sources.dart';
import 'package:life_wiev/services/Data/Repositories/motivation_quotes_repositories.dart';
import 'package:life_wiev/widgets/QuotesCard/cubit/quotes_card_cubit.dart';

class QoutesCardList extends StatelessWidget {
  const QoutesCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (context) => QoutesCardCubit(
          motivationQuotesRepositories: MotivationQuotesRepositories(
            motivationQuotesRemoteDioDataSources:
                MotivationQuotesRemoteDioDataSources(),
          ),
        )..start(),
        child: BlocBuilder<QoutesCardCubit, QoutesCardState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.initial:
                return const Center(
                  child: Text('Initial state'),
                );
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.success:
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (final quotesModel in state.results)
                      QoutesCard(model: quotesModel)
                  ],
                );
              case Status.error:
                return Center(
                  child: Text(state.errorMessage ?? 'Unknown error'),
                );
            }
          },
        ),
      ),
    );
  }
}

class QoutesCard extends StatelessWidget {
  const QoutesCard({
    required this.model,
    Key? key,
  }) : super(key: key);

  final QuotesModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[50],
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(.9),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            model.author,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(.9),
            ),
          ),
        ],
      ),
    );
  }
}
