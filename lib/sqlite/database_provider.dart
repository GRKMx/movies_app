import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {

  static final String dbName = "filmler_app.sqlite";

  static Future<Database> dbAccess() async {
    String dbPathway = join(await getDatabasesPath(),dbName);

    if (await databaseExists(dbPathway)){
      // DB exist. no need to copy.
      print("Veritabanı zaten vardı");
    } else {
      ByteData data = await rootBundle.load("database/$dbName");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(dbPathway).writeAsBytes(bytes,flush: true);
      print("Veritabanı kopyaandı");
    }
    return openDatabase(dbPathway);
  }
}