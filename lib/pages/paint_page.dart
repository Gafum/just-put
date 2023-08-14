import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:just_put/const/translate/translate.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaintPage extends StatefulWidget {
  final String appLanguage;
  final String imgData;
  final Function addImage;

  const PaintPage({
    Key? key,
    required this.appLanguage,
    required this.addImage,
    this.imgData = '',
  }) : super(key: key);

  @override
  State<PaintPage> createState() => _PaintPageState();
}

class _PaintPageState extends State<PaintPage> {
  late final WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            setState(
              () {
                isLoading = false;
              },
            );
          },
        ),
      )
      ..addJavaScriptChannel(
        'PageIsReady',
        onMessageReceived: (JavaScriptMessage message) {
          controller.runJavaScript(
              'translatePage(${json.encode(translation[widget.appLanguage]["home"]["paint"])}, "${widget.imgData}");');
        },
      )
      ..addJavaScriptChannel(
        'GoToAnotherHome',
        onMessageReceived: (JavaScriptMessage message) {
          if (message.message == 'goBack') {
            Navigator.pop(context);
          }
        },
      )
      ..addJavaScriptChannel(
        'SaveFile',
        onMessageReceived: (JavaScriptMessage message) {
          widget.addImage(message.message);
          Navigator.pop(context);
        },
      )
      ..enableZoom(false)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadFlutterAsset('assets/www/paint.html');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              WebViewWidget(
                controller: controller,
              ),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const Stack(),
            ],
          ),
        ),
      ),
    );
  }
}
