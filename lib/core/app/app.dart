import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:life_view/pages/root_page/views/root_page.dart';
import 'package:life_view/services/data_sources/data_sources.dart';
import 'package:life_view/services/repositories/dreams_repositories.dart';

import '../../pages/dreams_list_page/cubit/dreams_cubit.dart';

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
