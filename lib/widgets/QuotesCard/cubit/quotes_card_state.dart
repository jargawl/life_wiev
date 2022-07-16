part of 'quotes_card_cubit.dart';

@immutable
class QoutesCardState {
  final QuotesModel? results;
  final Status status;
  final String? errorMessage;

  const QoutesCardState({
    this.results ,
    this.errorMessage,
    this.status = Status.initial,
  });
}
