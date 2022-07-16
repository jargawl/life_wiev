import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:life_wiev/core/enums/enums.dart';
import 'package:life_wiev/models/ListItemModel/list_item_model.dart';
import 'package:life_wiev/services/Data&Repositories/Repositories/dreams_repositories.dart';
part 'dreams_state.dart';


@injectable  
class DreamsCubit extends Cubit<DreamsState> {
  DreamsCubit({required this.dreamsRepositories})
      : super(
          const DreamsState(
            documents: [],
            errorMessage: '',
            status: Status.initial,
          ),
        );
  StreamSubscription? _streamSubscription;
  final DreamsRepositories dreamsRepositories;

  Future<void> start() async {
    emit(
      const DreamsState(
        documents: [],
        errorMessage: '',
        status: Status.loading,
      ),
    );
    _streamSubscription = dreamsRepositories.getItemsStream().listen(
      (data) {
        emit(
          DreamsState(
            documents: data,
            status: Status.success,
            errorMessage: '',
          ),
        );
      },
    )..onError(
        (error) {
          DreamsState(
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
    await dreamsRepositories.delete(id: document.id);
  }

  Future<void> add({
    required String name,
  }) async {
    dreamsRepositories.add(name: name);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
