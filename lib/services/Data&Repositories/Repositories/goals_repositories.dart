import 'package:firebase_auth/firebase_auth.dart';
import 'package:life_wiev/models/ListItemModel/list_item_model.dart';
import 'package:life_wiev/services/Data&Repositories/DataSources/goals_data_sources.dart';

class GoalsRepositories {
  GoalsRepositories(this._goalsRemoteDataSource);
  final GoalsRemoteDataSource _goalsRemoteDataSource;

  Stream<List<ItemModel>> getItemsStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception('Jesteś nie zalogowany');
    }
    return _goalsRemoteDataSource.goalsRemoteData().map(
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
    return _goalsRemoteDataSource.delete(id: id);
  }

  Future<void> add({required String name}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception('Jesteś nie zalogowany');
    }
    return _goalsRemoteDataSource.add(name: name);
  }

// Metoda zlicznia ilości powodów do wdzięczności 
  // Future<int?> getCount() async {
  //   final userID = FirebaseAuth.instance.currentUser?.uid;
  //   if (userID == null) {
  //     Exception('Jesteś nie zalogowany');
  //   }
  //   _goalsRemoteDataSource;
  //   return null;
  // }
}
