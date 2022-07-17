import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class GratefulRemoteDataSource {
  @factoryMethod
  Stream<QuerySnapshot<Map<String, dynamic>>?> gratefulRemoteData() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception('Jesteś nie zalogowany');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('grateful')
        .snapshots();
  }

  Future<void> delete({required String id}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception('Jesteś nie zalogowany');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('grateful')
        .doc(id)
        .delete();
  }

  Future<void> add({required String name}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception('Jesteś nie zalogowany');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('grateful')
        .add({'name': name});
  }

// Metoda zlicznia ilości powodów do wdzięczności

  // Future<int?> getCount() async {
  //   final userID = FirebaseAuth.instance.currentUser?.uid;
  //   if (userID == null) {
  //     Exception('Jesteś nie zalogowany');
  //   }
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userID)
  //       .collection('grateful')
  //       .snapshots();
  //   return null;
  // }
}
