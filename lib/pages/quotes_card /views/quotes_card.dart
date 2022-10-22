import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_view/core/enums/enums.dart';
import 'package:life_view/models/quotes_model.dart';

import '../../../services/services.dart';
import '../cubit/quotes_card_cubit.dart';

class QuotesCardList extends StatelessWidget {
  const QuotesCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocProvider<QuotesCardCubit>(
        create: (context) => QuotesCardCubit(
          motivationQuotesRepositories: MotivationQuotesRepositories(
            motivationQuotesRemoteDioDataSources:
                MotivationQuotesRemoteRetrofitDataSources(
              Dio(),
            ),
          ),
        )..start(),
        child: BlocBuilder<QuotesCardCubit, QuotesCardState>(
          builder: (context, state) {
            final quotesCardModel = state.results;
            if (state.status == Status.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status == Status.error) {
              return const Text('error');
            }
            return Column(
              children: [
                if (quotesCardModel != null)
                  QuotesCard(quotesModel: quotesCardModel)
              ],
            );
          },
        ),
      ),
    );
  }
}

class QuotesCard extends StatelessWidget {
  const QuotesCard({
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
