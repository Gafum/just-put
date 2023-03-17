import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> savefile({required String fileName, required String data}) async {
  Directory? directory;
  try {
    if (Platform.isAndroid) {
      if (await _requestPermission(Permission.storage)) {
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
        newPath = "$newPath/JustPut";
        directory = Directory(newPath);
      } else {
        return false;
      }
    } else {
      if (await _requestPermission(Permission.photos)) {
        directory = await getTemporaryDirectory();
      } else {
        return false;
      }
    }
    File saveFile = File("${directory.path}/$fileName");
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    saveFile.writeAsString(data);
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> _requestPermission(Permission permission) async {
  if (await permission.isGranted) {
    return true;
  } else {
    var result = await permission.request();
    if (result.isGranted) {
      return true;
    }

    return false;
  }
}
