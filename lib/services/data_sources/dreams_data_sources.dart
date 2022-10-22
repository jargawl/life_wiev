import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';


@injectable  
class DreamsRemoteDataSource {
  @factoryMethod 
  Stream<QuerySnapshot<Map<String, dynamic>>?> dreamsRemoteData() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception('Jesteś nie zalogowany');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('dreams')
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
        .collection('dreams')
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
        .collection('dreams')
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
