import 'package:flutter/material.dart';

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

  late String dropdownValue;
  @override
  void initState() {
    dropdownValue = widget.appLanguage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
                translation[dropdownValue]!["home"]!["main-settings"]["name"])),
        body: ListView(
            padding: const EdgeInsets.only(
              top: 12.0,
            ),
            children: [
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText:
                      translation[dropdownValue]!["home"]!["main-settings"]
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
            ]),
      ),
    );
  }
}
