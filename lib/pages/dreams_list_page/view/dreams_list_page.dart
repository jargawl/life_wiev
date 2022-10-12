import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:life_view/core/enums/enums.dart';
import '../../../services/Data&Repositories/DataSources/dreams_data_sources.dart';
import '../../../services/Data&Repositories/Repositories/dreams_repositories.dart';
import '../cubit/dreams_cubit.dart';

class DreamsPage extends StatelessWidget {
  DreamsPage({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My dream is ...",
          style: GoogleFonts.wellfleet(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: BlocProvider<DreamsCubit>(
        create: (context) {
          return DreamsCubit(
            dreamsRepositories: DreamsRepositories(
              dreamsRemoteDataSource: DreamsRemoteDataSource(),
            ),
          );
        },
        child: BlocBuilder<DreamsCubit, DreamsState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                context.read<DreamsCubit>().add(
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
      body: BlocProvider<DreamsCubit>(
        create: (context) {
          return DreamsCubit(
            dreamsRepositories: DreamsRepositories(
              dreamsRemoteDataSource: DreamsRemoteDataSource(),
            ),
          )..start();
        },
        child: BlocBuilder<DreamsCubit, DreamsState>(
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
                          hintText: 'What is your realy big dream?',
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  for (final itemModel in itemModels) ...[
                    BlocBuilder<DreamsCubit, DreamsState>(
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
                            context.read<DreamsCubit>().delete(
                                  document: itemModel,
                                  id: itemModel.id,
                                );
                          },
                          child: NameWidgetDreams(
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

class NameWidgetDreams extends StatelessWidget {
  const NameWidgetDreams(
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
