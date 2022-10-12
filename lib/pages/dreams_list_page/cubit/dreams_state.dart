part of 'dreams_cubit.dart';

@immutable
class DreamsState {
  final List<ItemModel> documents;
  final Status status;
  final String? errorMessage;

  const DreamsState({
    required this.documents,
    required this.errorMessage,
    this.status = Status.initial,
  });
}
