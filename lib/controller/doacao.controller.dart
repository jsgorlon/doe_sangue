import 'package:doe_sangue/models/doacao.dart';
import 'package:doe_sangue/services/database_handler.dart';
import 'package:sqflite/sqflite.dart';

class DoacaoController {
  void read() {}

  void create(Doacao doacao) async {
    Database db = await DatabaseHandler.instance.database;
    try {
      db.insert('doacoes', doacao.toMap());
    } catch (e) {
      print(e);
    }
  }

  void update(Doacao doacao) {}

  void delete(Doacao doacao) {}
}
