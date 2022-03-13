import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../repositories/firestore_repository.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final Database _firestoreRepo;

  NoteCubit(this._firestoreRepo) : super(NoteInitial());

  static NoteCubit get(context) => BlocProvider.of(context);

  CollectionReference<Object?> getNotes() {
    try {
      final CollectionReference<Object?> notes =
          _firestoreRepo.getMainCollection();
      // emit(state.copyWith(notes: notes));
      emit(NoteLoadedState(notes));
      return notes;
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> addNote(
    String name,
    String title,
    String? date,
  ) async {
    await _firestoreRepo.addNote(name, title, date);
  }

  Future<void> updateNote(
    String name,
    String title,
    String? date,
    String? id,
  ) async {
    await _firestoreRepo.updateNote(name, title, date, id);
  }

  Future<void> deleteNote(String id) async {
    await _firestoreRepo.deleteNote(id);
  }
}
