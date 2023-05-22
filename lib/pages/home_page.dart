import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_put/pages/settings_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../const/translate/translate.dart';
import '../function/save_data.dart';
import '../widgets/HomePageWidgets/alert_dialog_input.dart';
import '../widgets/HomePageWidgets/slidable_list_element.dart';
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
  String appLanguage = "English";

  @override
  void initState() {
    super.initState();
    _getData();
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
      saveData(
        data: json.encode(projectList),
        myName: 'projectList',
      );
    });
  }

  void _getData() async {
    var prefs = await SharedPreferences.getInstance();
    final listInfo = prefs.getString('projectList');
    final languageInfo = prefs.getString('appLanguage');
    if (languageInfo != null) {
      setState(() {
        appLanguage = languageInfo;
      });
    }

    if (listInfo == null) return;
    setState(() {
      projectList = json.decode(listInfo);
    });
  }

  void changeLanguage(language) {
    setState(() {
      appLanguage = language;
    });
    saveData(
      data: appLanguage,
      myName: 'appLanguage',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            translation[appLanguage]!["home"]!["home"]["name"],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CustomPageRoute(
                            child: SettingsPage(
                          appLanguage: appLanguage,
                          changeLanguage: changeLanguage,
                        )));
                  },
                  child: const Icon(
                    Icons.settings,
                    size: 30.0,
                  ),
                )),
          ],
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
            saveData(
              data: json.encode(projectList),
              myName: 'projectList',
            );
          },
          children: <Widget>[
            for (final item in projectList)
              Container(
                key: ValueKey(item),
                margin: const EdgeInsets.only(bottom: 8.0),
                child: SlidableListElement(
                  item: item,
                  appLanguage: appLanguage,
                ),
              )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext alertContext) => ScaffoldMessenger(
              child: Builder(
                builder: (context) => Scaffold(
                  backgroundColor: Colors.transparent,
                  body: AlertDialogInput(
                    changeListOfProjects: changeListOfProjects,
                    appLanguage: appLanguage,
                  ),
                ),
              ),
            ),
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
