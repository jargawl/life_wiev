part of 'quotes_card_cubit.dart';

@immutable
class QuotesCardState {
  final QuotesModel? results;
  final Status status;
  final String? errorMessage;

  const QuotesCardState({
    this.results,
    this.errorMessage,
    this.status = Status.initial,
  });
}
