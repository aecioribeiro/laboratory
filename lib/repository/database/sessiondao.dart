import 'package:laboratory/data/places_model.dart';
import 'package:laboratory/repository/database/places_database.dart';

class SessionDAO {
  final PlacesDatabase databaseProvider;

  SessionDAO([PlacesDatabase? databaseProvider])
      : databaseProvider = PlacesDatabase.dbProvider;

  // CRUD / Create / Read / Update / Delete
  Future<PlacesResponse> getPlaces() async {
    final db = await databaseProvider.getDatabase();

    var result = await db.query(PlacesDatabase.name);

    List<PlacesModel> places = result.isNotEmpty
        ? result.map((e) => PlacesModel.fromJson(e)).toList()
        : [];

    return PlacesResponse(places: places);
  }

  Future<void> insert(PlacesModel entry) async {
    final db = databaseProvider.database;

    final values = {
      "title": entry.title,
      "createAt": entry.createdAt,
      "lat": entry.lat,
      "lng": entry.lng
    };

    db?.insert(
      PlacesDatabase.name,
      values,
    );
  }

  Future<int> update(PlacesModel entry) async {
    final db = await databaseProvider.database;

    final values = {
      "title": entry.title,
      "createdAt": entry.createdAt,
      "lat": entry.lat,
      "lng": entry.lng
    };

    var result = await db?.update(
      PlacesDatabase.name,
      values,
      where: "id = ?",
      whereArgs: [entry.id],
    );

    return result ?? -1;
  }

  Future<int> delete(int id) async {
    final db = await databaseProvider.database;

    var result = db?.delete(
      PlacesDatabase.name,
      where: "id=?",
      whereArgs: [id],
    );

    return result ?? -1;
  }
}
