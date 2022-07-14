import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:life_wiev/core/enums/enums.dart';
import 'package:life_wiev/models/QuotesModel/quotes_model.dart';
import 'package:life_wiev/services/Data/Repositories/motivation_quotes_repositories.dart';

part 'quotes_card_state.dart';

class QoutesCardCubit extends Cubit<QoutesCardState> {
  QoutesCardCubit({required this.motivationQuotesRepositories})
      : super(const QoutesCardState());

  final MotivationQuotesRepositories motivationQuotesRepositories;

  Future<void> start() async {
    emit(
      const QoutesCardState(
        status: Status.loading,
      ),
    );
    try {
      final results = await motivationQuotesRepositories.getQuotesModel();
      emit(
        QoutesCardState(
        status: Status.success,
        results: results,
      ));
    } catch (error) {
      emit(
        QoutesCardState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
