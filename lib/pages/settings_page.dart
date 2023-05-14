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
        appBar: AppBar(title: const Text("Settings")),
        body: ListView(
            padding: const EdgeInsets.only(
              top: 12.0,
            ),
            children: [
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color.fromRGBO(200, 190, 255, 1),
                ),
                dropdownColor: const Color.fromRGBO(200, 190, 255, 1),
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
