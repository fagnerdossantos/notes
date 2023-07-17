import 'package:flutter/material.dart'
    show Colors, WidgetsFlutterBinding, runApp;
import 'package:flutter/services.dart' show SystemChrome, SystemUiOverlayStyle;

import 'app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const AppWidget());

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}
