import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_put/pages/editor_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/alert_dialog_input.dart';
import '../widgets/custome_page_route.dart';

const List<Color> mainColors = [
  Color.fromRGBO(255, 191, 217, 1),
  Color.fromRGBO(255, 225, 215, 1),
  Color.fromRGBO(225, 255, 220, 1),
  Color.fromRGBO(225, 220, 255, 1),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var projectList = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _setData() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('projectList', json.encode(projectList));
  }

  void changeListOfProjects(nameOfProject, [String idOfProject = '']) {
    setState(() {
      projectList = [
        {
          'name': nameOfProject,
          'myId': idOfProject.isEmpty
              ? DateTime.now().millisecondsSinceEpoch.toString()
              : idOfProject,
          'color': Random().nextInt(mainColors.length)
        },
        ...projectList
      ];
      _setData();
    });
  }

  void _getData() async {
    var prefs = await SharedPreferences.getInstance();
    final counterInfo = prefs.getString('projectList');
    if (counterInfo == null) return;
    setState(() {
      projectList = json.decode(counterInfo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: ReorderableListView(
          padding: const EdgeInsets.only(
            top: 12.0,
            bottom: 80.0,
          ),
          onReorder: (int oldindex, int newindex) {
            setState(() {
              if (newindex > oldindex) {
                newindex -= 1;
              }
              final items = projectList.removeAt(oldindex);
              projectList.insert(newindex, items);
            });
            _setData();
          },
          children: <Widget>[
            for (final item in projectList)
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                margin: const EdgeInsets.only(bottom: 8.0),
                shadowColor: const Color.fromARGB(0, 0, 0, 0),
                elevation: 0.0,
                color: mainColors[item['color']],
                key: ValueKey(item),
                child: ListTile(
                  splashColor: const Color.fromARGB(166, 255, 184, 184),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                  ),
                  onTap: () => {
                    Navigator.push(
                      context,
                      CustomPageRoute(
                        child: EditorPage(
                          idOfProject: item['myId'],
                          nameOfProject: item['name'],
                        ),
                      ),
                    )
                  },
                  horizontalTitleGap: 0,
                  title: Text(
                    '${item['name']}',
                    style: const TextStyle(
                      fontFamily: 'Cuprum',
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) =>
                  AlertDialogInput(changeListOfProjects: changeListOfProjects)),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
