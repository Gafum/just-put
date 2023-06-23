import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:just_put/pages/home_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../const/hiden_const.dart';
import '../const/translate/translate.dart';
import '../function/code_creator.dart';
import '../function/save_data.dart';
import '../function/show_toast.dart';
import '../function/save_file.dart';
import '../widgets/custome_page_route.dart';

class ProjectSettings extends StatefulWidget {
  final String idOfProject;
  final String nameOfProject;
  final String appLanguage;

  const ProjectSettings({
    Key? key,
    required this.idOfProject,
    required this.nameOfProject,
    required this.appLanguage,
  }) : super(key: key);

  @override
  State<ProjectSettings> createState() => _ProjectSettingsState();
}

class _ProjectSettingsState extends State<ProjectSettings> {
  String _newProjectName = '';
  var projectList = [];
  String projectData = '';
  bool createJustPutFileText = false;
  bool createHTMLFileText = false;

  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    _getData();
    _loadAd();
    _newProjectName = widget.nameOfProject;
  }

  void deleteData() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(widget.idOfProject);
    prefs.remove('${widget.idOfProject}photos');
  }

  void _getData() async {
    var prefs = await SharedPreferences.getInstance();
    final jsonProjectList = prefs.getString('projectList');
    final localPrjData = prefs.getString(widget.idOfProject);
    var photosData = prefs.getString('${widget.idOfProject}photos');
    photosData ??= '[]';
    if (localPrjData == null) {
      projectData =
          'Problems with data... ( Perhaps you have not edited this project before. )';
    } else {
      projectData = '[$localPrjData, $photosData]';
    }
    if (jsonProjectList == null) return;
    setState(() {
      projectList = json.decode(jsonProjectList);
    });
  }

  void closeSettings() {
    saveData(
      myName: 'projectList',
      data: json.encode(projectList),
    );
    Navigator.pushAndRemoveUntil(
      context,
      CustomPageRoute(
        child: const HomePage(),
      ),
      (route) => false,
    );
  }

  void _loadAd() {
    InterstitialAd.load(
      adUnitId: adInterstitialId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              '${translation[widget.appLanguage]!["home"]!["main-settings"]["name"]} ${widget.nameOfProject}'),
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios_rounded,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(padding: const EdgeInsets.all(12.0), children: [
          Row(
            /*  ============================================= Change Name of Project */
            children: [
              Flexible(
                flex: 4,
                child: TextFormField(
                  initialValue: widget.nameOfProject,
                  onChanged: (String value) {
                    _newProjectName = value;
                  },
                  maxLength: 25,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                      hintText: translation[widget.appLanguage]!["home"]![
                          "project-settings"]["change"],
                      labelStyle: const TextStyle(fontFamily: 'Cuprum')),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 7.0,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (RegExp(r'[^A-Za-z0-9]').hasMatch(
                          _newProjectName.trim().replaceAll(' ', ''))) {
                        showToast(
                            context,
                            translation[widget.appLanguage]!["home"]!["home"]
                                ["alert"]["problem"]);
                        return;
                      }
                      if (_newProjectName
                          .trim()
                          .replaceAll(' ', '')
                          .isNotEmpty) {
                        /* Change the name of project */
                        projectList[projectList.indexWhere((element) {
                          return element['myId'] == widget.idOfProject;
                        })]['name'] = _newProjectName.trim();

                        /* go to the main scene and save all data */
                        closeSettings();
                      }
                    },
                    child: Text(
                      translation[widget.appLanguage]!["home"]!["home"]["alert"]
                          ["btns"][1],
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
          ElevatedButton.icon(
            /*  ============================================= Create JustPut file */
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
                backgroundColor: Colors.green),
            onPressed: () async {
              await _interstitialAd?.show();
              await saveFile(
                fileName:
                    '${widget.nameOfProject}${DateTime.now().millisecondsSinceEpoch}.txt',
                data: projectData,
              ).then((value) {
                setState(() {
                  createJustPutFileText = value == "saved";
                });
                showToast(
                    context,
                    value == "saved"
                        ? translation[widget.appLanguage]!["home"]![
                            "project-settings"]["file-saved"]
                        : value);
                _loadAd();
              });
            },
            icon: const Icon(Icons.save_alt_rounded),
            label: Text(createJustPutFileText
                ? translation[widget.appLanguage]!["home"]!["project-settings"]
                    ["saved"]
                : translation[widget.appLanguage]!["home"]!["project-settings"]
                    ["just-put"]),
          ),
          const SizedBox(
            width: double.infinity,
            height: 5.0,
          ),
          ElevatedButton.icon(
            /*  ============================================= Create HTML*/
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
              backgroundColor: const Color.fromRGBO(245, 144, 115, 1),
            ),
            onPressed: () async {
              await _interstitialAd?.show();

              await saveFile(
                fileName:
                    '${widget.nameOfProject}${DateTime.now().millisecondsSinceEpoch}.html',
                data: codeCreator(value: projectData, inApp: ''),
              ).then((value) {
                setState(() {
                  createHTMLFileText = value == "saved";
                });
                showToast(
                    context,
                    value == "saved"
                        ? translation[widget.appLanguage]!["home"]![
                            "project-settings"]["file-saved"]
                        : value);
                _loadAd();
              });
            },
            icon: const Icon(Icons.web_asset),
            label: Text(createHTMLFileText
                ? translation[widget.appLanguage]!["home"]!["project-settings"]
                    ["saved"]
                : translation[widget.appLanguage]!["home"]!["project-settings"]
                    ["html"]),
          ),
          ElevatedButton.icon(
              /*  ============================================= Delete Project */
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
                backgroundColor: const Color.fromRGBO(235, 68, 100, 1),
              ),
              onPressed: () async {
                deleteData();
                projectList.removeWhere(
                    (element) => element['myId'] == widget.idOfProject);
                closeSettings();
              },
              icon: const Icon(Icons.delete_rounded),
              label: Text(
                translation[widget.appLanguage]!["home"]!["project-settings"]
                    ["delete"],
                style: const TextStyle(fontFamily: 'Cuprum'),
              )),
        ]),
      ),
    );
  }
}
