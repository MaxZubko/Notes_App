import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_task/widgets/snack_bar.dart';

import '../bloc/note_cubit.dart';
import '../screens/add_and_edit_note_page.dart';

class ListNoteWidget extends StatefulWidget {
  AsyncSnapshot<QuerySnapshot> snapshot;

  ListNoteWidget({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  State<ListNoteWidget> createState() => _ListNoteWidgetState();
}

class _ListNoteWidgetState extends State<ListNoteWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    NoteCubit cubit = NoteCubit.get(context);
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        return FadeTransition(
          opacity: animation,
          child: ListView.builder(
              itemCount: widget.snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                final reversedList =
                    widget.snapshot.data!.docs.reversed.toList();
                QueryDocumentSnapshot<Object?> documentSnapshot =
                    reversedList[index];
                return Dismissible(
                    key: Key(documentSnapshot.id),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      cubit.deleteNote(documentSnapshot.id);
                      SnackBarWidget().showSnackBarDelete(context);
                    },
                    background: Container(
                      padding: const EdgeInsets.only(right: 20),
                      alignment: Alignment.centerRight,
                      color: Colors.red,
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    child: ListTile(
                      onTap: () => Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: AddAndEditNotePage(
                                header: documentSnapshot['name'],
                                title: documentSnapshot['title'],
                                date: documentSnapshot['date'],
                                id: documentSnapshot.id,
                              ))),
                      title: Text(documentSnapshot['name'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700)),
                      subtitle: Text(documentSnapshot['title'],
                          style: const TextStyle(fontSize: 15)),
                      trailing: Text(documentSnapshot['date'] ?? ''),
                    ));
              }),
        );
      },
    );
  }
}
