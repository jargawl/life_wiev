import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:life_wiev/core/conteiner/injection_conteiner.config.dart';

final getIt = GetIt.instance;

@InjectableInit()  

void configureDependencies() => $initGetIt(getIt);
