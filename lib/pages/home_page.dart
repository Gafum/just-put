import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_put/pages/editor_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custome_page_route.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const storageDataId = 'projectList';

  String _newProjectName = '';
  var _projectList = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _setData() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(storageDataId, json.encode(_projectList));
  }

  void _getData() async {
    var prefs = await SharedPreferences.getInstance();
    final counterInfo = prefs.getString(storageDataId);
    if (counterInfo == null) return;
    setState(() {
      _projectList = json.decode(counterInfo);
    });
  }

  void _closeDialog() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(5),
          child: ListView.builder(
            itemCount: _projectList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 7.0, top: 2.0, bottom: 2.0),
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color.fromRGBO(252, 111, 83, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${_projectList[index]['name']}',
                      style: const TextStyle(
                        fontFamily: 'Cuprum',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          CustomPageRoute(
                            child: EditorPage(
                              idOfProject: _projectList[index]['myId'],
                              nameOfProject: _projectList[index]['name'],
                            ),
                          ),
                        )
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Add project'),
              content: TextField(
                onChanged: (String value) {
                  _newProjectName = value;
                },
                autofocus: true,
                decoration: const InputDecoration(
                    hintText: 'Enter name',
                    labelStyle: TextStyle(fontFamily: 'Cuprum')),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: _closeDialog,
                  child: const Text(
                    'Cancel',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _projectList.add({
                        'name': _newProjectName,
                        'myId':
                            DateTime.now().millisecondsSinceEpoch.toString(),
                      });
                    });
                    _setData();
                    _closeDialog();
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
