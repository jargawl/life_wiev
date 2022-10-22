import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:life_view/models/list_item_model.dart';

import '../services.dart';

@injectable
class DreamsRepositories {
  DreamsRepositories({required this.dreamsRemoteDataSource});
  final DreamsRemoteDataSource dreamsRemoteDataSource;

  Stream<List<ItemModel>> getItemsStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception('Jesteś nie zalogowany');
    }
    return dreamsRemoteDataSource.dreamsRemoteData().map(
      (querySnapshot) {
        return querySnapshot!.docs.map((doc) {
          return ItemModel(
            name: doc['name'],
            id: doc.id,
          );
        }).toList();
      },
    );
  }

  Future<void> delete({required String id}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception('Jesteś nie zalogowany');
    }
    return dreamsRemoteDataSource.delete(id: id);
  }

  Future<void> add({required String name}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception('Jesteś nie zalogowany');
    }
    return dreamsRemoteDataSource.add(name: name);
  }

// Metoda zlicznia ilości powodów do wdzięczności
  // Future<int?> getCount() async {
  //   final userID = FirebaseAuth.instance.currentUser?.uid;
  //   if (userID == null) {
  //     Exception('Jesteś nie zalogowany');
  //   }
  //   _DreamsRemoteDataSource;
  //   return null;
  // }
}
