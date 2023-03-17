import 'package:flutter/material.dart';
import 'package:just_put/const/list_of_elements.dart';
import 'package:just_put/pages/setting_project.dart';
import 'package:just_put/pages/view_result.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custome_page_route.dart';

class EditorPage extends StatefulWidget {
  final String idOfProject;
  final String nameOfProject;

  const EditorPage({
    Key? key,
    required this.idOfProject,
    required this.nameOfProject,
  }) : super(key: key);

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  late final WebViewController controller;

  void _saveData(data) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(widget.idOfProject, data);
  }

  Future<String> _getData() async {
    var prefs = await SharedPreferences.getInstance();
    final counterInfo = prefs.getString(widget.idOfProject);
    if (counterInfo == null) {
      return '[{"data":[],"functions":[],"name":"${widget.nameOfProject}"}]';
    }
    return counterInfo;
  }

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadFlutterAsset('assets/www/html_editor.html')
      ..enableZoom(false)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'PageIsReady',
        onMessageReceived: (JavaScriptMessage message) {
          _getData().then((value) => controller
              .runJavaScript('''ListOfElements = $stringListOfElements;
\n renderList($value, '${widget.nameOfProject}');'''));
        },
      )
      ..addJavaScriptChannel(
        'SaveDataInFlutter',
        onMessageReceived: (JavaScriptMessage message) {
          _saveData(message.message);
        },
      )
      ..addJavaScriptChannel(
        'StartView',
        onMessageReceived: (JavaScriptMessage message) {
          _saveData(message.message);
          Navigator.push(
            context,
            CustomPageRoute(
              child: ViewResult(
                data: message.message,
                idOfProject: widget.idOfProject,
              ),
            ),
          );
        },
      )
      ..addJavaScriptChannel(
        'GoToAnotherHome',
        onMessageReceived: (JavaScriptMessage message) {
          if (message.message == 'goBack') {
            Navigator.pop(context);
          } else if (message.message == 'goToSettings') {
            Navigator.push(
              context,
              CustomPageRoute(
                child: ProjectSettings(
                  idOfProject: widget.idOfProject,
                  nameOfProject: widget.nameOfProject,
                ),
              ),
            );
          }
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
