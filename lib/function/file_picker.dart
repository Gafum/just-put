import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';

const musicFormat = ['mp3', 'm4a', 'wav', 'flac', 'aac'];
const imageFormat = ["jpeg", "jpg", "gif", "png", "tiff", "bmp", "pdf"];

Future<String> getBase64(String myPath, bool isAudio) async {
  final bytes = await File(myPath).readAsBytes();
  final base64 = base64Encode(bytes);
  if (isAudio) {
    return 'data:audio/mp3;base64,$base64';
  } else {
    return 'data:image/jpeg;base64,$base64';
  }
}

Future pickFile(bool isAudio, String name) async {
  List myformat = isAudio ? musicFormat : imageFormat;
  FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: musicFormat,
  );
  if (pickedFile == null) return null;

  if (!myformat.contains(pickedFile.files.first.extension.toString())) {
    return null;
  }
  String base64 =
      await getBase64(pickedFile.files.first.path.toString(), isAudio);

  if (isAudio) {
    return '''addNewImage({data: "0", name: "$name", isAudio: "$base64"});''';
  } else {
    return '''addNewImage({data: "$base64", name: "$name", isAudio: false});''';
  }
}
