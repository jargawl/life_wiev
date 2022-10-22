import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:life_view/core/enums/enums.dart';
import 'package:life_view/models/quotes_model.dart';
import 'package:life_view/services/repositories/motivation_quotes_repositories.dart';

part 'quotes_card_state.dart';

class QuotesCardCubit extends Cubit<QuotesCardState> {
  QuotesCardCubit({required this.motivationQuotesRepositories})
      : super(const QuotesCardState());

  final MotivationQuotesRepositories motivationQuotesRepositories;

  Future<void> start() async {
    emit(
      const QuotesCardState(
        status: Status.loading,
      ),
    );
    try {
      final results = await motivationQuotesRepositories.getQuotesModel();
      emit(
        QuotesCardState(
          status: Status.success,
          results: results,
        ),
      );
    } catch (error) {
      emit(
        QuotesCardState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
