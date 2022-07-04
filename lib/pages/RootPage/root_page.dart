import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_wiev/pages/HomePage/home_page.dart';
import 'package:life_wiev/pages/LoginPage/LoginPage/cubit/login_page_cubit.dart';
import 'package:life_wiev/pages/LoginPage/LoginPage/login_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginPageCubit()..start(),
      child: BlocBuilder<LoginPageCubit, LoginPageState>(
        builder: (context, state) {
          final user = state.user;
          if (user == null) {
            return LoginPage();
          }
          return HomePage(user: user);
        },
      ),
    );
  }
}
