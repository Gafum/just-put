import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_put/const/list_of_elements.dart';
import 'package:just_put/pages/setting_project.dart';
import 'package:just_put/pages/view_result.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../function/request_permision.dart';
import '../function/show_toast.dart';
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
  bool isLoading = true;

  void _saveData({required String data, String whatData = ''}) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(widget.idOfProject + whatData, data);
  }

  Future<String> getImageBase64(String imagePath) async {
    final bytes = await File(imagePath).readAsBytes();
    final base64 = base64Encode(bytes);
    return 'data:image/jpeg;base64,$base64';
  }

  Future<String> _getData() async {
    if (!await requestPermission(Permission.storage)) {
      return 'BigProblem';
    }

    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString(widget.idOfProject);
    var photosData = prefs.getString('${widget.idOfProject}photos');

    data ??=
        '[{"data":[],"functions":[],"name":"${widget.nameOfProject}", "piecesName": ["Main"],  "codePiece": 0}, [[]]]';
    photosData ??= '[]';

    return '[$data, $photosData]';
  }

  Future<Map<String, String>> pickImageAndSave(String filename) async {
    if (!await requestPermission(Permission.storage)) {
      return {'text': 'Give Permission'};
    }
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return {'text': 'No selected file'};

    try {
      var base64data = await getImageBase64(pickedImage.path);
      return {'text': '$filename added', 'base64data': base64data};
    } catch (e) {
      return {'text': e.toString()};
    }
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
          _getData().then((value) {
            if (value == 'BigProblem') return;
            controller.runJavaScript('''
            ListOfElements = $stringListOfElements;
            readData($value, '${widget.nameOfProject}');''');
            setState(() {
              isLoading = false;
            });
          });
        },
      )
      ..addJavaScriptChannel(
        'SaveDataInFlutter',
        onMessageReceived: (JavaScriptMessage message) {
          _saveData(
            data: message.message,
          );
        },
      )
      ..addJavaScriptChannel(
        'SaveTextures',
        onMessageReceived: (JavaScriptMessage message) {
          _saveData(data: message.message, whatData: 'photos');
        },
      )
      ..addJavaScriptChannel(
        'StartView',
        onMessageReceived: (JavaScriptMessage message) {
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
        'SelectFile',
        onMessageReceived: (JavaScriptMessage message) {
          pickImageAndSave(message.message).then((value) {
            showToast(context, value['text']!);
            if (value['base64data']!.isEmpty) return;
            controller.runJavaScript('''
addNewImage({data: "${value['base64data']}", name: "${message.message}"});''');
          });
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
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            WebViewWidget(
              controller: controller,
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(),
          ],
        ),
      ),
    );
  }
}
