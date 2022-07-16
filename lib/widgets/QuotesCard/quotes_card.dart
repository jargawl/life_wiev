import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_wiev/core/enums/enums.dart';
import 'package:life_wiev/models/QuotesModel/quotes_model.dart';
import 'package:life_wiev/services/Data&Repositories/DataSources/motivation_quotes_data_sources.dart';
import 'package:life_wiev/services/Data&Repositories/Repositories/motivation_quotes_repositories.dart';

import 'package:life_wiev/widgets/QuotesCard/cubit/quotes_card_cubit.dart';

class QoutesCardList extends StatelessWidget {
  const QoutesCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (context) => QoutesCardCubit(
          MotivationQuotesRepositories(
            MotivationQuotesRemoteRetrofitDataSources(
              Dio(),
            ),
          ),
        )..start(),
        child: BlocBuilder<QoutesCardCubit, QoutesCardState>(
          builder: (context, state) {
            final qoutesCardmodel = state.results;
            if (state.status == Status.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status == Status.error) {
              return const Text('error');
            }
            return Column(
              children: [
                if (qoutesCardmodel != null)
                  QoutesCard(quotesModel: qoutesCardmodel)
              ],
            );
          },
        ),
      ),
    );
  }
}

class QoutesCard extends StatelessWidget {
  const QoutesCard({
    required this.quotesModel,
    Key? key,
  }) : super(key: key);

  final QuotesModel quotesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 197, 229, 244),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Text(
            quotesModel.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.wellfleet(
              color: Colors.lightBlue,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            quotesModel.author,
            textAlign: TextAlign.center,
            style: GoogleFonts.wellfleet(
              color: Colors.lightBlue,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
