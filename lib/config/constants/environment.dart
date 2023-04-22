
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String movieDBUrl = dotenv.env['THE_MOVIEDB_URL'] ?? 'No url found for movie db';
  static String movieDBKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No api key found for movie db';
}