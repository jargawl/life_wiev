import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:life_view/core/enums/enums.dart';
import 'package:life_view/services/Data&Repositories/Repositories/gratefuls_repositories.dart';

import '../../../models/list_item_model.dart';

part 'grateful_state.dart';

@injectable
class GratefulCubit extends Cubit<GratefulState> {
  GratefulCubit({required this.gratefulRepositories})
      : super(
          const GratefulState(
            documents: [],
            errorMessage: '',
            status: Status.initial,
          ),
        );
  StreamSubscription? _streamSubscription;
  final GratefulRepositories gratefulRepositories;

  Future<void> start() async {
    emit(
      const GratefulState(
        documents: [],
        errorMessage: '',
        status: Status.loading,
      ),
    );
    _streamSubscription = gratefulRepositories.getItemsStream().listen(
      (data) {
        emit(
          GratefulState(
            documents: data,
            status: Status.success,
            errorMessage: '',
          ),
        );
      },
    )..onError(
        (error) {
          GratefulState(
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
    await gratefulRepositories.delete(id: document.id);
  }

  Future<void> add({
    required String name,
  }) async {
    gratefulRepositories.add(name: name);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
