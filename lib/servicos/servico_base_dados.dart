import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ServicoBD {
  static Database? _db;

  // ── abre (ou cria) a base de dados ──────────────────────────────────────
  static Future<Database> get baseDados async {
    if (_db != null) return _db!;

    final caminho = join(await getDatabasesPath(), 'perfil.db');

    _db = await openDatabase(
      caminho,
      version: 1,
      onCreate: (db, versao) async {
        await db.execute('''
          CREATE TABLE perfil (
            id    INTEGER PRIMARY KEY,
            nome  TEXT    NOT NULL,
            email TEXT    NOT NULL
          )
        ''');
      },
    );

    return _db!;
  }

  // ── guardar ou actualizar o perfil ──────────────────────────────────────
  static Future<void> guardarPerfil(String nome, String email) async {
    final db = await baseDados;

    // usa o id fixo 1 — só existe um perfil local
    await db.insert(
      'perfil',
      {'id': 1, 'nome': nome, 'email': email},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // ── carregar o perfil guardado ───────────────────────────────────────────
  static Future<Map<String, String>?> carregarPerfil() async {
    final db = await baseDados;
    final linhas = await db.query('perfil', where: 'id = ?', whereArgs: [1]);

    if (linhas.isEmpty) return null;

    return {
      'nome':  linhas.first['nome']  as String,
      'email': linhas.first['email'] as String,
    };
  }

  // ── apagar o perfil ──────────────────────────────────────────────────────
  static Future<void> apagarPerfil() async {
    final db = await baseDados;
    await db.delete('perfil', where: 'id = ?', whereArgs: [1]);
  }
}
