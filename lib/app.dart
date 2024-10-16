// Flutter imports:
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Project imports:
import './theme/theme.dart';
import 'routes/pages.dart';
import 'routes/routes.dart';
import 'util/initial_bindings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: Routes.SPLASH,
      getPages: Pages.pages,
    );
  }
}
