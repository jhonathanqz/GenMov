import '../helper/database_strings.dart';

abstract class DatabaseScript {
  static const userTableScript = '''
      CREATE TABLE IF NOT EXISTS ${DatabaseStrings.userTable} 
      (id INTEGER PRIMARY KEY AUTOINCREMENT,
      email TEXT,
      password TEXT)
      ''';
}
