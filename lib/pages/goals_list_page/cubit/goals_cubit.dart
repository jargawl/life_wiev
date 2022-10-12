import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:life_view/core/enums/enums.dart';
import 'package:life_view/models/list_item_model.dart';
import 'package:life_view/services/Data&Repositories/Repositories/goals_repositories.dart';
part 'goals_state.dart';

@injectable
class GoalsCubit extends Cubit<GoalsState> {
  GoalsCubit({required this.goalsRepositories})
      : super(
          const GoalsState(
            documents: [],
            errorMessage: '',
            status: Status.initial,
          ),
        );
  StreamSubscription? _streamSubscription;
  final GoalsRepositories goalsRepositories;

  Future<void> start() async {
    emit(
      const GoalsState(
        documents: [],
        errorMessage: '',
        status: Status.loading,
      ),
    );
    _streamSubscription = goalsRepositories.getItemsStream().listen(
      (data) {
        emit(
          GoalsState(
            documents: data,
            status: Status.success,
            errorMessage: '',
          ),
        );
      },
    )..onError(
        (error) {
          GoalsState(
            documents: const [],
            status: Status.error,
            errorMessage: error.toString(),
          );
        },
      );
  }

  Future<void> delete({
    required document,
    required id,
  }) async {
    await goalsRepositories.delete(id: document.id);
  }

  Future<void> add({
    required String name,
  }) async {
    goalsRepositories.add(name: name);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
