import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_put/const/list_of_elements.dart';
import 'package:just_put/pages/project_settings.dart';
import 'package:just_put/pages/view_result.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const/hiden_const.dart'; /* addMod const */
import '../function/request_permision.dart'; /* Permissions */
import '../function/save_data.dart';
import '../function/show_toast.dart'; /* Toast */
import '../widgets/custome_page_route.dart'; /* Animation page navigation */

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
  BannerAd? _bannerAd;

  Future<String> getImageBase64(String imagePath) async {
    final bytes = await File(imagePath).readAsBytes();
    final base64 = base64Encode(bytes);
    return 'data:image/jpeg;base64,$base64';
  }

  Future<String> _getData() async {
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
    _loadAd();
    controller = WebViewController()
      ..setBackgroundColor(Colors.white)
      ..loadFlutterAsset('assets/www/html_editor.html')
      ..enableZoom(false)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'PageIsReady',
        onMessageReceived: (JavaScriptMessage message) {
          _getData().then((value) {
            controller.runJavaScript('''
            ListOfElements = ${json.encode(ListOfElements)};
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
          saveData(data: message.message, myName: widget.idOfProject);
        },
      )
      ..addJavaScriptChannel(
        'SaveTextures',
        onMessageReceived: (JavaScriptMessage message) {
          saveData(
              data: message.message, myName: '${widget.idOfProject}photos');
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
            Column(
              children: <Widget>[
                Expanded(
                  child: WebViewWidget(
                    controller: controller,
                  ),
                ),
                if (_bannerAd != null)
                  SizedBox(
                    height: 50,
                    width: _bannerAd!.size.width.toDouble(),
                    child: AdWidget(ad: _bannerAd!),
                  ),
              ],
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

  void _loadAd() async {
    BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}
