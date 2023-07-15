import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../const/translate/translate.dart';

class SettingsPage extends StatefulWidget {
  final String appLanguage;
  final Function changeLanguage;
  const SettingsPage({
    super.key,
    required this.appLanguage,
    required this.changeLanguage,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static List<DropdownMenuItem<String>> list = translation.keys
      .toList()
      .expand((item) => [DropdownMenuItem(value: item, child: Text(item))])
      .toList();

  String appVersion = "0.0";

  late String dropdownValue;
  @override
  void initState() {
    dropdownValue = widget.appLanguage;
    super.initState();
    PackageInfo.fromPlatform().then(
      (value) => setState(
        () {
          appVersion = value.version.toString();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              translation[dropdownValue]!["home"]!["main-settings"]["name"]),
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios_rounded,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.only(
            top: 12.0,
          ),
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "v$appVersion  ",
                style: const TextStyle(fontSize: 18),
              ),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: translation[dropdownValue]!["home"]!["main-settings"]
                    ["language"],
                contentPadding: const EdgeInsets.only(
                  left: 12.0,
                  bottom: 8.0,
                  right: 8.0,
                ),
                labelStyle:
                    const TextStyle(color: Color.fromARGB(200, 75, 75, 75)),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.green),
                ),
              ),
              dropdownColor: const Color.fromARGB(255, 255, 255, 255),
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
                widget.changeLanguage(newValue);
              },
              items: list,
            ),
          ],
        ),
      ),
    );
  }
}
