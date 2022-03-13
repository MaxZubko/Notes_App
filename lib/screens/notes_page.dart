import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_task/animation/route_animation.dart';
import 'package:test_task/constant.dart';
import 'package:test_task/widgets/block_list_notes.dart';
import 'package:test_task/widgets/list_notes.dart';

import '../bloc/note_cubit.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPage();
}

class _NotesPage extends State<NotesPage> {
  bool _changeList = false;

  @override
  Widget build(BuildContext context) {
    NoteCubit cubit = NoteCubit.get(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
          backgroundColor: secondaryColor,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _changeList = !_changeList;
                  });
                },
                icon: Icon(_changeList
                    ? Icons.view_agenda
                    : Icons.view_agenda_outlined)),
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          // stream: Database().getMainCollection().snapshots(),
          stream: cubit.getNotes().snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return _changeList
                ? ListNoteWidget(snapshot: snapshot)
                : BlockListNotesWidget(snapshot: snapshot);
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          tooltip: 'Add',
          onPressed: (() => Navigator.of(context)
              .push(RouteAnimation().createRouteAnimation())),
        ));
  }
}
