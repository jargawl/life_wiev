import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'grateful_state.dart';

class GratefulCubit extends Cubit<GratefulState> {
  GratefulCubit() : super(GratefulInitial());
}
