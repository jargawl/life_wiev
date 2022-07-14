part of 'quotes_card_cubit.dart';

@immutable
class QoutesCardState {
  final List<QuotesModel> results;
  final Status status;
  final String? errorMessage;

  const QoutesCardState({
    this.results = const [],
    this.errorMessage,
    this.status = Status.initial,
  });
}
