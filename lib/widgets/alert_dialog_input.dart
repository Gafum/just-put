import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlertDialogInput extends StatefulWidget {
  final Function changeListOfProjects;

  const AlertDialogInput({
    Key? key,
    required this.changeListOfProjects,
  }) : super(key: key);
  @override
  State<AlertDialogInput> createState() => _AlertDialogInputState();
}

class _AlertDialogInputState extends State<AlertDialogInput> {
  String _newProjectName = '';

  bool createOrImport = false;

  Future<dynamic> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt', 'justput'],
    );

    if (result != null && result.files.single.path != null) {
      PlatformFile file = result.files.first;

      File file0 = File(file.path.toString());
      final contents = await file0.readAsString();

      return contents;
    } else {
      return null;
    }
  }

  void _saveData(String idOfProject, String jsonData) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(idOfProject, jsonData);
  }

  void _closeDialog() {
    Navigator.of(context).pop();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(children: [
        Expanded(
          flex: 2,
          child: Text(
            createOrImport ? 'Import' : 'Add project',
            textAlign: TextAlign.center,
          ),
        ),
        Flexible(
          flex: 1,
          child: IconButton(
              onPressed: () {
                setState(() {
                  createOrImport = !createOrImport;
                });
              },
              icon: const Icon(Icons.import_export_rounded)),
        ),
        Expanded(
          flex: 2,
          child: Text(
            createOrImport ? 'Add project' : 'Import',
            textAlign: TextAlign.center,
          ),
        )
      ]),
      content: createOrImport
          ? ElevatedButton(
              onPressed: () {
                _closeDialog();
                var idOfProject =
                    '${DateTime.now().millisecondsSinceEpoch}Imported';
                _pickFile().then((data) async {
                  _saveData(idOfProject, data);
                  await widget.changeListOfProjects(
                      json.decode(data)[0]['name'], idOfProject);
                });
              },
              child: const Text(
                'Import',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
            )
          : TextField(
              onChanged: (String value) {
                setState(() {
                  _newProjectName = value;
                });
              },
              maxLength: 25,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              autofocus: false,
              decoration: const InputDecoration(
                  hintText: 'Enter name',
                  labelStyle: TextStyle(fontFamily: 'Cuprum')),
            ),
      actions: <Widget>[
        TextButton(
          onPressed: _closeDialog,
          child: const Text(
            'Cancel',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
        ),
        createOrImport
            ? const SizedBox(
                width: 10,
                height: 5,
              )
            : TextButton(
                onPressed: () {
                  if (_newProjectName.isNotEmpty) {
                    widget.changeListOfProjects(_newProjectName);
                    _closeDialog();
                  }
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    color:
                        _newProjectName.isNotEmpty ? Colors.green : Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
      ],
    );
  }

  void changeListOfProjects(String newProjectName) {}
}
