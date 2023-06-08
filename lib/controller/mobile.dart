
import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
Future <void>SaveAndLaundFile(List<int> bytes,String filenName)async{
  final path=(await getExternalStorageDirectory())!.path;
  final file=File('$path/$filenName');
  await file.writeAsBytes(bytes,flush: true);
  OpenFile.open('$path/$filenName');
}