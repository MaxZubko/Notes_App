part of 'note_cubit.dart';

@immutable
abstract class NoteState {
  const NoteState();
}
// class NoteState {
//   final CollectionReference<Object?>? notes;

//   const NoteState({
//     this.notes,
//   });

//   NoteState copyWith({CollectionReference<Object?>? notes}) {
//     return NoteState(
//       notes: notes ?? this.notes,
//     );
//   }
// }

class NoteInitial extends NoteState {}

class NoteLoadingstate extends NoteState {}

class NoteLoadedState extends NoteState {
  final CollectionReference<Object?>? notes;

  const NoteLoadedState(this.notes);
}

class NoteErrorState extends NoteState {
  final String error;

  const NoteErrorState(this.error);
}
