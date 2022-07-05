import 'package:flutter/material.dart';
import 'package:life_wiev/core/enums/enums.dart';
import 'package:life_wiev/models/ListItemModel/list_item_model.dart';


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
