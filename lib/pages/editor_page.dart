import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:just_put/const/list_of_elements.dart';
import 'package:just_put/pages/paint_page.dart';
import 'package:just_put/pages/project_settings.dart';
import 'package:just_put/pages/view_result.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const/hiden_const.dart'; /* addMod const */
import '../const/translate/translate.dart';
import '../function/file_picker.dart';
/* Permissions */
import '../function/save_data.dart';
/* Toast */
import '../function/show_toast.dart';
import '../widgets/custome_page_route.dart'; /* Animation page navigation */

class EditorPage extends StatefulWidget {
  final String idOfProject;
  final String nameOfProject;
  final String appLanguage;

  const EditorPage({
    Key? key,
    required this.idOfProject,
    required this.nameOfProject,
    required this.appLanguage,
  }) : super(key: key);

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  late final WebViewController controller;
  bool isLoading = true;
  BannerAd? _bannerAd;

  Future<String> _getData() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString(widget.idOfProject);
    var photosData = prefs.getString('${widget.idOfProject}photos');

    data ??=
        '[{"data":[],"functions":[],"name":"${widget.nameOfProject}", "piecesName": ["Main"],  "codePiece": 0}, [[]]]';
    photosData ??= '[]';

    return '[$data, $photosData]';
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
            appLanguage = ${json.encode(translation[widget.appLanguage]!["html"])};
            sortOrder = ${json.encode(sortOrder)};
            readData($value, '${widget.nameOfProject}');
            ''');
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
                appLanguage: widget.appLanguage,
              ),
            ),
          );
        },
      )
      ..addJavaScriptChannel(
        'SelectFile',
        onMessageReceived: (JavaScriptMessage message) {
          Map<String, dynamic> fileData = json.decode(message.message);
          pickFile(fileData['isAudio'], fileData['name']).then((code) {
            if (code == null) {
              showToast(context, "Problem with file");
            } else {
              controller.runJavaScript(code);
            }
          }).catchError((e) {
            showToast(context, "Permission denied 0(");
          });
        },
      )
      ..addJavaScriptChannel(
        'PaintImg',
        onMessageReceived: (JavaScriptMessage message) {
          Navigator.push(
            context,
            CustomPageRoute(
              child: PaintPage(
                appLanguage: widget.appLanguage,
                addImage: (value) => {
                  controller.runJavaScript('''
addNewImage({data: "$value", name: "${message.message}"});
''')
                },
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
                  appLanguage: widget.appLanguage,
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
                : const Stack(),
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
