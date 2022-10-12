part of 'goals_cubit.dart';

@immutable
class GoalsState {
  final List<ItemModel> documents;
  final Status status;
  final String? errorMessage;

  const GoalsState({
    required this.documents,
    required this.errorMessage,
    this.status = Status.initial,
  });
}
