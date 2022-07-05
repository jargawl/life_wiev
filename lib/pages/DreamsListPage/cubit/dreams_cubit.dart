import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dreams_state.dart';

class DreamsCubit extends Cubit<DreamsState> {
  DreamsCubit() : super(DreamsInitial());
}
