import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:life_view/pages/grateful_list_page/cubit/grateful_cubit.dart';
import 'package:life_view/pages/login_page/cubit/login_page_cubit.dart';
import 'package:life_view/pages/quotes_card%20/cubit/quotes_card_cubit.dart';
import 'package:life_view/pages/root_page/views/root_page.dart';
import 'package:life_view/services/data_sources/data_sources.dart';
import 'package:life_view/services/repositories/repositories.dart';
import '../../pages/dreams_list_page/cubit/dreams_cubit.dart';
import '../../pages/goals_list_page/cubit/goals_cubit.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DreamsCubit(
            dreamsRepositories: DreamsRepositories(
              dreamsRemoteDataSource: DreamsRemoteDataSource(),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => GoalsCubit(
            goalsRepositories: GoalsRepositories(
              goalsRemoteDataSource: GoalsRemoteDataSource(),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => GratefulCubit(
            gratefulRepositories: GratefulRepositories(
              gratefulRemoteDataSource: GratefulRemoteDataSource(),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => LoginPageCubit(),
        ),
        BlocProvider(
          create: (_) => QuotesCardCubit(
            motivationQuotesRepositories: MotivationQuotesRepositories(
              motivationQuotesRemoteDioDataSources:
                  MotivationQuotesRemoteRetrofitDataSources(
                Dio(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Life View',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('pl', ''), // Polish, no country code
        ],
        home: const RootPage(),
      ),
    );
  }
}
