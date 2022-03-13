import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  CollectionReference getMainCollection() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore.collection('notes');
  }

  Future<void> addNote(
    String name,
    String title,
    String? date,
  ) {
    CollectionReference mainCollection = getMainCollection();
    return mainCollection
        .doc()
        .set({'name': name, 'title': title, 'date': date})
        .then((value) => print('Note Added'))
        .catchError((error) => print('Failed to add note: $error'));
  }

  Future<void> updateNote(
    String name,
    String title,
    String? date,
    String? id,
  ) {
    CollectionReference mainCollection = getMainCollection();
    return mainCollection
        .doc(id)
        .update({'name': name, 'title': title, 'date': date})
        .then((value) => print('Note Added'))
        .catchError((error) => print('Failed to add note: $error'));
  }

  Future<void> deleteNote(
    String id,
  ) {
    CollectionReference mainCollection = getMainCollection();
    return mainCollection
        .doc(id)
        .delete()
        .then((value) => print('Note Deleted'))
        .catchError((error) => print('Failed to delete user: $error'));
  }
}
