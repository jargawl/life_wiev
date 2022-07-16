import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:life_wiev/core/enums/enums.dart';
import 'package:life_wiev/models/ListItemModel/list_item_model.dart';
import 'package:life_wiev/services/Data&Repositories/Repositories/gratefuls_repositories.dart';

part 'grateful_state.dart';

class GratefulCubit extends Cubit<GratefulState> {
  GratefulCubit(this._gratefulRepositories)
      : super(
          const GratefulState(
            documents: [],
            errorMessage: '',
            status: Status.initial,
          ),
        );
  StreamSubscription? _streamSubscription;
  final GratefulRepositories _gratefulRepositories;

  Future<void> start() async {
    emit(
      const GratefulState(
        documents: [],
        errorMessage: '',
        status: Status.loading,
      ),
    );
    _streamSubscription = _gratefulRepositories.getItemsStream().listen(
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
    await _gratefulRepositories.delete(id: document.id);
  }

  Future<void> add({
    required String name,
  }) async {
    _gratefulRepositories.add(name: name);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
