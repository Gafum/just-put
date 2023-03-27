import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../function/create_code.dart';

class ViewResult extends StatefulWidget {
  final String data;
  final String idOfProject;

  const ViewResult({
    Key? key,
    required this.idOfProject,
    required this.data,
  }) : super(key: key);

  @override
  State<ViewResult> createState() => _ViewResultState();
}

class _ViewResultState extends State<ViewResult> {
  late final WebViewController controller;
  bool isLoading = true;

  void _saveData(String data) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('${widget.idOfProject}storedData', data);
  }

  Future<String> _getData() async {
    var prefs = await SharedPreferences.getInstance();
    final counterInfo = prefs.getString('${widget.idOfProject}storedData');
    if (counterInfo == null) {
      return '';
    }
    return counterInfo;
  }

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..addJavaScriptChannel(
        'StoreDataInDevice',
        onMessageReceived: (JavaScriptMessage message) {
          _saveData(message.message);
        },
      )
      ..setNavigationDelegate(NavigationDelegate(onPageFinished: (String url) {
        setState(() {
          isLoading = false;
        });
      }))
      ..enableZoom(false)
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    _getData().then((value) {
      return controller.loadHtmlString(codeCreator(widget.data, value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'View Result',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios_rounded,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
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
                  : Stack(),
            ],
          ),
        ),
      ),
    );
  }
}
