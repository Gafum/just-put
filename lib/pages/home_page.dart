import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_put/pages/editor_page.dart';
import 'package:just_put/pages/setting_project.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/alert_dialog_input.dart';
import '../widgets/custome_page_route.dart';

const List<Color> mainColors = [
  Color.fromRGBO(255, 205, 205, 1),
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
      projectList.add({
        'name': nameOfProject,
        'myId': idOfProject.isEmpty
            ? DateTime.now().millisecondsSinceEpoch.toString()
            : idOfProject,
        'color': Random().nextInt(mainColors.length)
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
        resizeToAvoidBottomInset: false,
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
                vertical: 10.0,
                horizontal: 2.0,
              ),
              itemCount: projectList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: index == projectList.length - 1
                      ? const EdgeInsets.only(bottom: 80.0)
                      : const EdgeInsets.only(bottom: 10.0),
                  child: ListTile(
                    splashColor: const Color.fromARGB(126, 139, 139, 139),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    ),
                    contentPadding: const EdgeInsets.only(
                      left: 15.0,
                      right: 10.0,
                    ),
                    horizontalTitleGap: 0,
                    onLongPress: () => {
                      Navigator.push(
                        context,
                        CustomPageRoute(
                          child: ProjectSettings(
                            idOfProject: projectList[index]['myId'],
                            nameOfProject: projectList[index]['name'],
                          ),
                        ),
                      )
                    },
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
                      borderRadius: BorderRadius.circular(5),
                    ),
                    tileColor: mainColors[projectList[index]['color']],
                    title: Text(
                      '${projectList[index]['name']}',
                      style: const TextStyle(
                        fontFamily: 'Cuprum',
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
