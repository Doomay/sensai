import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sensai/util/dependency_injection.dart';
// Project imports:
import './app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
  DependencyInjection.init();
}

initHiveForFlutter() {}