import 'package:bytebank2/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> geteDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.tabelaSql);
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );
}
