import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_wiev/core/enums/enums.dart';
import 'package:life_wiev/pages/GoalsListPage/cubit/goals_cubit.dart';
import 'package:life_wiev/services/Data/DataSources/goals_data_sources.dart';
import 'package:life_wiev/services/Data/Repositories/goals_repositories.dart';


class GoalsPage extends StatelessWidget {
  GoalsPage({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Goal is ...",
          style: GoogleFonts.wellfleet(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: BlocProvider(
        create: (context) => GoalsCubit(
          GoalsRepositories(
            GoalsRemoteDataSource(),
          ),
        ),
        child: BlocBuilder<GoalsCubit, GoalsState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                context.read<GoalsCubit>().add(
                      name: controller.text,
                    );
                controller.clear();
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => GoalsCubit(
          GoalsRepositories(
            GoalsRemoteDataSource(),
          ),
        )..start(),
        child: BlocBuilder<GoalsCubit, GoalsState>(
          builder: (context, state) {
            if (state.status == Status.error) {
              final errorMessage =
                  state.errorMessage ?? 'Something went wrong...';
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.amber,
              ));
            }

            if (state.status == Status.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            final itemModels = state.documents;
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://images.photowall.com/products/60742/palm-trees-on-white-beach.jpg?h=699&q=85',
                  ),
                ),
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      color: const Color.fromARGB(255, 233, 227, 213),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.wellfleet(),
                          hintText: 'What is your goals?',
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  for (final itemModel in itemModels) ...[
                    BlocBuilder<GoalsCubit, GoalsState>(
                      builder: (context, state) {
                        return Dismissible(
                          key: ValueKey(itemModel.id),
                          background: const DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.red,
                            ),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: 32,
                                ),
                                child: Icon(
                                  Icons.delete,
                                ),
                              ),
                            ),
                          ),
                          confirmDismiss: (direction) async {
                            return direction == DismissDirection.endToStart;
                          },
                          onDismissed: (_) {
                            context.read<GoalsCubit>().delete(
                                  document: itemModel,
                                  id: itemModel.id,
                                );
                          },
                          child: NameWidgetGoals(
                            itemModel.name,
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class NameWidgetGoals extends StatelessWidget {
  const NameWidgetGoals(
    this.name, {
    Key? key,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        color: Colors.lightBlue[200],
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Text(
        name,
        style: GoogleFonts.wellfleet(
          color: Colors.white,
          fontSize: 23,
        ),
      ),
    );
  }
}
