import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_task/constant.dart';
import 'package:test_task/widgets/checkbox.dart';
import 'package:test_task/widgets/button_note.dart';

import '../widgets/alert_dialog.dart';

class AddAndEditNotePage extends StatelessWidget {
  final String? header;
  final String? title;
  final String? date;
  final String? id;

  AddAndEditNotePage({Key? key, this.header, this.title, this.date, this.id})
      : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _headerController = TextEditingController();
  final _titleController = TextEditingController();
  String? formattedDate =
      DateFormat('kk:mm:ss yyy-MM-dd').format(DateTime.now().toLocal());

  bool isShowDialog = false;

  @override
  Widget build(BuildContext context) {
    _headerController.text = header ?? '';
    _titleController.text = title ?? '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
        backgroundColor: secondaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            isShowDialog
                ? Navigator.pop(context)
                : SnowAlertDialogWidget().showAlertDialog(
                    context,
                    _headerController.text,
                    _titleController.text,
                    formattedDate,
                    id);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _headerController,
                        decoration: kTextFieldDecoration,
                      ),
                      TextFormField(
                        controller: _titleController,
                        decoration:
                            kTextFieldDecoration.copyWith(labelText: 'Title'),
                        maxLines: null,
                      ),
                    ],
                  )),
              Row(children: [
                const CheckBoxWidget(),
                Text(formattedDate!),
              ]),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    isShowDialog = true;
                    if (id == null) {
                      ButtonNoteWidget().addNote(
                          context,
                          _headerController.text,
                          _titleController.text,
                          formattedDate);
                    } else {
                      ButtonNoteWidget().updateNote(
                          context,
                          _headerController.text,
                          _titleController.text,
                          formattedDate,
                          id);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: id == null ? const Text('Add') : const Text('Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
