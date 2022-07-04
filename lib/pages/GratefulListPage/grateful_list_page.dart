import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_wiev/core/enums/enums.dart';
import 'package:life_wiev/pages/GratefulListPage/cubit/grateful_cubit.dart';
import 'package:life_wiev/services/Data/DataSources/gratefuls_data_sources.dart';
import 'package:life_wiev/services/Data/Repositories/gratefuls_repositories.dart';

class GratefulPage extends StatelessWidget {
  GratefulPage({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
        title: Text(
          'coś tam ',
          style: GoogleFonts.pacifico(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: BlocProvider(
        create: (context) => GratefulCubit(
          GratefulRepositories(
            GratefulRemoteDataSource(),
          ),
        ),
        child: BlocBuilder<GratefulCubit, GratefulState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                context.read<GratefulCubit>().add(
                      name: controller.text,
                    );
                controller.clear();
              },
              child: const Icon(
                Icons.add,
                color: Color.fromARGB(255, 47, 184, 129),
              ),
            );
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => GratefulCubit(
          GratefulRepositories(
            GratefulRemoteDataSource(),
          ),
        )..start(),
        child: BlocBuilder<GratefulCubit, GratefulState>(
          builder: (context, state) {
            if (state.status == Status.error) {
              final errorMessage =
                  state.errorMessage ?? 'Wystąpił nieoczekiwany błąd';
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
                  image: NetworkImage(
                    'https://media0.giphy.com/media/vWSBsXFFZOdXO6rJYM/giphy.gif?cid=6c09b95245n48aszelfom5zs77m08y1jnyeubkv331ij1l9q&rid=giphy.gif&ct=ts',
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
                          hintStyle: GoogleFonts.pacifico(),
                          hintText: 'coś tam ',
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  for (final itemModel in itemModels) ...[
                    BlocBuilder<GratefulCubit, GratefulState>(
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
                            context.read<GratefulCubit>().delete(
                                  document: itemModel,
                                  id: itemModel.id,
                                );
                          },
                          child: NameWidgetGrateful(
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

class NameWidgetGrateful extends StatelessWidget {
  const NameWidgetGrateful(
    this.name, {
    Key? key,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 23, 213, 169),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Text(
        name,
        style: GoogleFonts.pacifico(
          color: Colors.white,
          fontSize: 23,
        ),
      ),
    );
  }
}
