import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:life_wiev/pages/DreamsListPage/cubit/dreams_cubit.dart';
import 'package:life_wiev/pages/GoalsListPage/cubit/goals_cubit.dart';
import 'package:life_wiev/pages/GratefulListPage/cubit/grateful_cubit.dart';
import 'package:life_wiev/services/Data&Repositories/DataSources/dreams_data_sources.dart';
import 'package:life_wiev/services/Data&Repositories/DataSources/goals_data_sources.dart';
import 'package:life_wiev/services/Data&Repositories/DataSources/gratefuls_data_sources.dart';
import 'package:life_wiev/services/Data&Repositories/DataSources/motivation_quotes_data_sources.dart';
import 'package:life_wiev/services/Data&Repositories/Repositories/dreams_repositories.dart';
import 'package:life_wiev/services/Data&Repositories/Repositories/goals_repositories.dart';
import 'package:life_wiev/services/Data&Repositories/Repositories/gratefuls_repositories.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // Bloc
  getIt.registerFactory(() => DreamsCubit(dreamsRepositories: getIt()));
  getIt.registerFactory(() => GoalsCubit(goalsRepositories: getIt()));
  getIt.registerFactory(() => GratefulCubit(gratefulRepositories: getIt()));
  
// Repositories
  getIt.registerFactory(
      () => DreamsRepositories(dreamsRemoteDataSource: getIt()));
  getIt
      .registerFactory(() => GoalsRepositories(goalsRemoteDataSource: getIt()));
  getIt.registerFactory(
      () => GratefulRepositories(gratefulRemoteDataSource: getIt()));
  

  // DataSources
  getIt.registerFactory(() => DreamsRemoteDataSource());
  getIt.registerFactory(() => GoalsRemoteDataSource());
  getIt.registerFactory(() => GratefulRemoteDataSource());
  
}
