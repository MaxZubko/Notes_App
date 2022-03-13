import 'package:flutter/cupertino.dart';
import 'package:test_task/widgets/checkbox.dart';
import 'package:test_task/widgets/snack_bar.dart';

import '../bloc/note_cubit.dart';

class ButtonNoteWidget {
  void addNote(
    BuildContext context,
    String header,
    String title,
    String? formattedDate,
  ) {
    NoteCubit cubit = NoteCubit.get(context);
    if (CheckBoxWidget.isChecked == true) {
      cubit.addNote(header, title, formattedDate);
    } else {
      formattedDate = null;
      cubit.addNote(header, title, formattedDate);
    }
    SnackBarWidget().showSnackBarAdd(context);
  }

  void updateNote(
    BuildContext context,
    String header,
    String title,
    String? formattedDate,
    String? id,
  ) {
    NoteCubit cubit = NoteCubit.get(context);
    if (CheckBoxWidget.isChecked == true) {
      cubit.updateNote(header, title, formattedDate, id);
    } else {
      formattedDate = null;
      cubit.updateNote(header, title, formattedDate, id);
    }
    SnackBarWidget().showSnackBarUpdate(context);
  }
}
