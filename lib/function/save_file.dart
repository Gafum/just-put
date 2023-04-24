import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'request_permision.dart';

Future<String> saveFile({
  required String fileName,
  required String data,
}) async {
  Directory? directory;
  try {
    if (Platform.isAndroid) {
      if (await requestPermission(Permission.storage)) {
        directory = await getExternalStorageDirectory();
        String newPath = "";
        List<String> paths = directory!.path.split("/");
        for (int x = 1; x < paths.length; x++) {
          String folder = paths[x];
          if (folder != "Android") {
            newPath += "/$folder";
          } else {
            break;
          }
        }

        newPath = "$newPath/Download/JustPut";
        directory = Directory(newPath);
      } else {
        return 'Give Permission!!!';
      }
    } else {
      if (await requestPermission(Permission.photos)) {
        directory = await getTemporaryDirectory();
      } else {
        return 'IOS problems';
      }
    }
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    File saveFile = File("${directory.path}/$fileName");
    saveFile.writeAsString(data);
    return 'File is saved in /Download/JustPut';
  } catch (e) {
    return e.toString();
  }
}
