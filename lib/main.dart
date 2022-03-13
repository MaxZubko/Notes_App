import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/constant.dart';
import 'package:test_task/repositories/firestore_repository.dart';
import 'package:test_task/routes.dart';
import 'package:test_task/screens/add_and_edit_note_page.dart';

import 'bloc/note_cubit.dart';
import 'screens/notes_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NoteCubit>(
      create: (context) => NoteCubit(Database()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          canvasColor: secondaryColor,
        ),
        title: 'Notes',
        initialRoute: NotesPageR,
        routes: {
          NotesPageR: (context) => const NotesPage(),
          AddAndEditPageR: (context) => AddAndEditNotePage(),
        },
      ),
    );
  }
}
