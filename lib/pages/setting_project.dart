import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:just_put/pages/home_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../const/hiden_const.dart';
import '../function/create_code.dart';
import '../function/show_toast.dart';
import '../widgets/access_phone_storage.dart';
import '../widgets/custome_page_route.dart';

class ProjectSettings extends StatefulWidget {
  final String idOfProject;
  final String nameOfProject;

  const ProjectSettings({
    Key? key,
    required this.idOfProject,
    required this.nameOfProject,
  }) : super(key: key);

  @override
  State<ProjectSettings> createState() => _ProjectSettingsState();
}

class _ProjectSettingsState extends State<ProjectSettings> {
  String _newProjectName = '';
  var projectList = [];
  String projectData = '';
  bool addIsLoaded = false;

  RewardedAd? _rewardedAd;

  @override
  void initState() {
    super.initState();
    _getData();
    _loadAd();
    addIsLoaded = false;
    _newProjectName = widget.nameOfProject;
  }

  void _setData() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('projectList', json.encode(projectList));
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
    _setData();
    Navigator.pushAndRemoveUntil(
      context,
      CustomPageRoute(
        child: const HomePage(),
      ),
      (route) => false,
    );
  }

  void _loadAd() {
    RewardedAd.load(
      adUnitId: adRewardedId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          setState(() {
            addIsLoaded = true;
          });
          ad.fullScreenContentCallback = FullScreenContentCallback(
              // Called when the ad showed the full screen content.
              onAdShowedFullScreenContent: (ad) {},
              // Called when an impression occurs on the ad.
              onAdImpression: (ad) {},
              // Called when the ad failed to show full screen content.
              onAdFailedToShowFullScreenContent: (ad, err) {
                // Dispose the ad here to free resources.
                ad.dispose();
              },
              // Called when the ad dismissed full screen content.
              onAdDismissedFullScreenContent: (ad) {
                // Dispose the ad here to free resources.
                ad.dispose();
              },
              // Called when a click is recorded for an ad.
              onAdClicked: (ad) {});

          debugPrint('$ad loaded.');
          // Keep a reference to the ad so you can show it later.
          _rewardedAd = ad;
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (LoadAdError error) {
          showToast(context, "Problem to load Adds");
        },
      ),
    );
  }

  @override
  void dispose() {
    _rewardedAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings ${widget.nameOfProject}'),
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios_rounded,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(children: [
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
                    decoration: const InputDecoration(
                        hintText: 'Change name',
                        labelStyle: TextStyle(fontFamily: 'Cuprum')),
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
                          if (_newProjectName.isNotEmpty) {
                            projectList[projectList.indexWhere((element) =>
                                    element['myId'] == widget.idOfProject)]
                                ['name'] = _newProjectName;
                            closeSettings();
                          }
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        )),
                  ),
                )
              ],
            ),
            ElevatedButton.icon(
                /*  ============================================= Create JustPut file */
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    backgroundColor: addIsLoaded ? Colors.green : Colors.grey),
                onPressed: () async {
                  if (!addIsLoaded) return;
                  await _rewardedAd?.show(onUserEarnedReward:
                      (AdWithoutView ad, RewardItem rewardItem) async {
                    await savefile(
                      fileName:
                          '${widget.nameOfProject}${DateTime.now().millisecondsSinceEpoch}.txt',
                      data: projectData,
                    ).then((value) {
                      showToast(context, value);
                      _loadAd();
                      setState(() {
                        addIsLoaded = false;
                      });
                    });
                  });
                },
                icon: const Icon(Icons.save_alt_rounded),
                label: addIsLoaded
                    ? const Text('Create JustPut file')
                    : const Text("Conecting to the Internet")),
            const SizedBox(
              width: double.infinity,
              height: 5.0,
            ),
            ElevatedButton.icon(
                /*  ============================================= Create HTML*/
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                  backgroundColor: addIsLoaded
                      ? const Color.fromRGBO(245, 144, 115, 1)
                      : Colors.grey,
                ),
                onPressed: () async {
                  if (!addIsLoaded) return;
                  await _rewardedAd?.show(onUserEarnedReward:
                      (AdWithoutView ad, RewardItem rewardItem) async {
                    await savefile(
                      fileName:
                          '${widget.nameOfProject}${DateTime.now().millisecondsSinceEpoch}.html',
                      data: codeCreator(value: projectData, inApp: ''),
                    ).then((value) {
                      showToast(context, value);
                      _loadAd();
                      setState(() {
                        addIsLoaded = false;
                      });
                    });
                  });
                },
                icon: const Icon(Icons.web_asset),
                label: addIsLoaded
                    ? const Text('Create html file')
                    : const Text("Conecting to the Internet")),
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
                label: const Text(
                  'Delete Project',
                  style: TextStyle(fontFamily: 'Cuprum'),
                )),
          ]),
        ),
      ),
    );
  }
}
