import 'dart:io';
import 'package:path_provider/path_provider.dart';

// Global variable for initialization
bool _isInitialized = false;
late File _logFile;

// Initialize the logger and specify log file path
Future<void> _initLogger() async {
  if (_isInitialized) return;

  final directory = await _getLogDirectory();
  _logFile = File('${directory.path}/app_log.txt');

  // If the log file doesn't exist, create it
  if (!(await _logFile.exists())) {
    await _logFile.create();
  }

  _isInitialized = true;
}

// Function to print and log message
Future<void> printLog(Object message) async {
  if (!_isInitialized) {
    await _initLogger();  // Ensure logger is initialized
  }

  final logMessage = '${DateTime.now()}: $message';

  // Print to console
  printLog(logMessage);

  // Append to log file
  await _logFile.writeAsString('$logMessage\n', mode: FileMode.append);
}

// Get the directory for storing logs (depends on platform)
Future<Directory> _getLogDirectory() async {
  if (Platform.isAndroid || Platform.isIOS) {
    return await getApplicationDocumentsDirectory();
  } else {
    return Directory.current;  // For desktop or standalone Dart apps
  }
}
