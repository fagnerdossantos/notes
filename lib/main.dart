import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:notes/app_widget.dart';

void main() {
  runApp(const AppWidget());

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}
