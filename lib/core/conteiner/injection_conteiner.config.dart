// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../pages/dreams_list_page/cubit/dreams_cubit.dart' as _i9;
import '../../pages/goals_list_page/cubit/goals_cubit.dart' as _i10;
import '../../pages/grateful_list_page/cubit/grateful_cubit.dart' as _i11;
import '../../services/Data&Repositories/DataSources/dreams_data_sources.dart'
    as _i3;
import '../../services/Data&Repositories/DataSources/goals_data_sources.dart'
    as _i5;
import '../../services/Data&Repositories/DataSources/gratefuls_data_sources.dart'
    as _i7;
import '../../services/Data&Repositories/Repositories/dreams_repositories.dart'
    as _i4;
import '../../services/Data&Repositories/Repositories/goals_repositories.dart'
    as _i6;
import '../../services/Data&Repositories/Repositories/gratefuls_repositories.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.DreamsRemoteDataSource>(() => _i3.DreamsRemoteDataSource());
  gh.factory<_i4.DreamsRepositories>(() => _i4.DreamsRepositories(
      dreamsRemoteDataSource: get<_i3.DreamsRemoteDataSource>()));
  gh.factory<_i5.GoalsRemoteDataSource>(() => _i5.GoalsRemoteDataSource());
  gh.factory<_i6.GoalsRepositories>(() => _i6.GoalsRepositories(
      goalsRemoteDataSource: get<_i5.GoalsRemoteDataSource>()));
  gh.factory<_i7.GratefulRemoteDataSource>(
      () => _i7.GratefulRemoteDataSource());
  gh.factory<_i8.GratefulRepositories>(() => _i8.GratefulRepositories(
      gratefulRemoteDataSource: get<_i7.GratefulRemoteDataSource>()));
  gh.factory<_i9.DreamsCubit>(
      () => _i9.DreamsCubit(dreamsRepositories: get<_i4.DreamsRepositories>()));
  gh.factory<_i10.GoalsCubit>(
      () => _i10.GoalsCubit(goalsRepositories: get<_i6.GoalsRepositories>()));
  gh.factory<_i11.GratefulCubit>(() => _i11.GratefulCubit(
      gratefulRepositories: get<_i8.GratefulRepositories>()));
  return get;
}
