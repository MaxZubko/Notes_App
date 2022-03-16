import 'package:flutter/material.dart';
import 'package:test_task/constant.dart';
import 'package:test_task/routes.dart';
import 'package:test_task/screens/notes_page.dart';
import 'package:test_task/widgets/button_note.dart';

class SnowAlertDialogWidget {
  showAlertDialog(
    BuildContext context,
    String header,
    String title,
    String? formattedDate,
    String? id,
  ) {
    showGeneralDialog(
        context: context,
        transitionDuration: const Duration(milliseconds: 400),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
              scale: a1.value,
              child: Opacity(
                  opacity: a1.value,
                  child: AlertDialog(
                      backgroundColor: secondaryColor,
                      title: const Text('What to do with the data?'),
                      actions: [
                        TextButton(
                            style: TextButton.styleFrom(
                              primary: primaryColor,
                            ),
                            child: const Text('Save and exit'),
                            onPressed: () {
                              if (id == null) {
                                ButtonNoteWidget().addNote(
                                    context, header, title, formattedDate);
                              } else {
                                ButtonNoteWidget().updateNote(
                                    context, header, title, formattedDate, id);
                              }
                              Navigator.popUntil(
                                  context, ModalRoute.withName(NotesPageR));
                            }),
                        TextButton(
                            child: const Text('Do not save'),
                            onPressed: () {
                              Navigator.popUntil(
                                  context, ModalRoute.withName(NotesPageR));
                            }),
                      ])));
        },
        pageBuilder: (context, animation1, animation2) {
          return Container();
        });
  }
}
