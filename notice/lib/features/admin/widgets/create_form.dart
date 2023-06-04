import 'package:bloc_test/features/admin/widgets/notice_card.dart';
import 'package:bloc_test/features/notice/bloc/notice_bloc.dart';
import 'package:bloc_test/features/notice/model/notice_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showTitleContentBottomSheet(BuildContext context) {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController attachmentController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  String? selectedYear;
  String? selectedProgram;
  String? selectedDep;

  List<String> yearOptions = ['Year 1', 'Year 2', 'Year 3', 'Year 4', 'Year 5'];
  List<String> programOptions = ['regular', 'weekend', 'extension'];
  List<String> departmentOptions = [
    'software',
    'electical',
    'chemical',
    'biomedical',
    'civil'
  ];

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add Notice',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
           
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: contentController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Content',
              ),
            ),
 
            TextField(
              controller: authorController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Author',
              ),
            ),
            TextField(
              controller: attachmentController,
              decoration: const InputDecoration(
                labelText: 'Attachment',
              ),
            ),
       
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Year',
              ),
              value: null,
              items: yearOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle year selection
                selectedYear = newValue!;
              },
            ),
            const SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Program',
              ),
              value: null,
              items: programOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle program selection
                selectedProgram = newValue!;
              },
            ),
            const SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Department',
              ),
              value: null,
              items: departmentOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                selectedDep = newValue!;
              },
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                Notice notice = Notice(
                    title: titleController.text,
                    content: contentController.text,
                    author: authorController.text,
                    visibility: 'yes',
                    year: selectedDep!,
                    typeOfProgram: selectedProgram!,
                    userId: "6477bdf792aa4e51ef73d838",
                    department: selectedDep!);
              BlocProvider.of<NoticeBloc>(context).add(CreateNoticeEvent(notice: notice));
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
