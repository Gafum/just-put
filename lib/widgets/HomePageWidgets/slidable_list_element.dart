import 'package:flutter/material.dart';

import '../custome_page_route.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:just_put/pages/project_settings.dart';
import 'card_in_home_page.dart';

class SlidableListElement extends StatelessWidget {
  final Map item;
  final String appLanguage;
  const SlidableListElement({
    Key? key,
    required this.item,
    required this.appLanguage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 2,
            onPressed: (context) => {
              Navigator.push(
                context,
                CustomPageRoute(
                  child: ProjectSettings(
                    idOfProject: item['myId'],
                    nameOfProject: item['name'],
                  ),
                ),
              )
            },
            backgroundColor: const Color.fromARGB(255, 235, 68, 100),
            foregroundColor: Colors.white,
            icon: Icons.settings,
          ),
        ],
      ),
      child: CardInHomePage(
        item: item,
        appLanguage: appLanguage,
      ),
    );
  }
}
