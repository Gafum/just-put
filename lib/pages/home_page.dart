import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:just_put/pages/editor_page.dart';
import 'package:just_put/pages/setting_project.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/alert_dialog_input.dart';
import '../widgets/custome_page_route.dart';

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
      projectList.add({
        'name': nameOfProject,
        'myId': idOfProject.isEmpty
            ? DateTime.now().millisecondsSinceEpoch.toString()
            : idOfProject,
      });
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
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(5),
          child: ListView.builder(
              padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 10.0, horizontal: 4.0),
              itemCount: projectList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 7.0),
                  child: ListTile(
                    splashColor: const Color.fromRGBO(235, 68, 100, 0.5),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    leading: IconButton(
                      alignment: const Alignment(-5.0, -2.5),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CustomPageRoute(
                            child: ProjectSettings(
                              idOfProject: projectList[index]['myId'],
                              nameOfProject: projectList[index]['name'],
                            ),
                          ),
                        );
                      },
                      icon: Image.asset(
                        'assets/images/settings-btn.png',
                        width: 30.0,
                        color: Colors.black,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 0, horizontal: 10.0),
                    horizontalTitleGap: 0,
                    onTap: () => {
                      Navigator.push(
                        context,
                        CustomPageRoute(
                          child: EditorPage(
                            idOfProject: projectList[index]['myId'],
                            nameOfProject: projectList[index]['name'],
                          ),
                        ),
                      )
                    },
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    tileColor: Colors.white,
                    title: Text(
                      '${projectList[index]['name']}',
                      style: const TextStyle(
                        fontFamily: 'Calibri',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              }),
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
