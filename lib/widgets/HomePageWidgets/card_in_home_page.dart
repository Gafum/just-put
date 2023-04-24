import 'package:flutter/material.dart';

import '../../pages/editor_page.dart';
import '../../pages/home_page.dart';
import '../custome_page_route.dart';

class CardInHomePage extends StatelessWidget {
  final Map item;
  const CardInHomePage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      margin: const EdgeInsets.only(bottom: 0.0),
      elevation: 0.0,
      color: mainColors[item['color']],
      child: ListTile(
        splashColor: const Color.fromARGB(188, 255, 184, 184),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.black,
        ),
        onTap: () => {
          Navigator.push(
            context,
            CustomPageRoute(
              child: EditorPage(
                idOfProject: item['myId'],
                nameOfProject: item['name'],
              ),
            ),
          )
        },
        horizontalTitleGap: 0,
        title: Text(
          '${item['name']}',
          style: const TextStyle(
            fontFamily: 'Cuprum',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
