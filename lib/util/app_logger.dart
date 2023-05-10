import 'package:logger/logger.dart';

final logger = Logger(
  level: Level.debug,
  printer: PrettyPrinter(
      methodCount: 1,
      // スタックトレースの表示階層
      errorMethodCount: 5,
      // スタックトレースの1行の長さ
      lineLength: 120,
      // width of the output
      colors: true,
      // Colorful log messages
      printEmojis: true,
      // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
  ),
);
