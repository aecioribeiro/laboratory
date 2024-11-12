import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class PlacesDatabase {
  static PlacesDatabase dbProvider = PlacesDatabase();
  static String name = "places";

  String dbCreate = """
    CREATE TABLE ${PlacesDatabase.name}(
      id INTEGER AUTOINCREMENT,
      title TEXT,
      createAt INTEGER,
      lat TEXT,
      lng TEXT,
      PRIMARY KEY id
    );
  """;

  Database? database;

  Future<Database> getDatabase() async {
    database ??= await createDatabase();
    return database!;
  }

  Future<Database> createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, "places.db");

    var database = openDatabase(
      path,
      version: 1,
      onCreate: initDB,
      onUpgrade: onUpgrade,
    );

    return database;
  }

  void initDB(Database db, int version) async {
    db.execute(dbCreate);
  }

  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }
}
