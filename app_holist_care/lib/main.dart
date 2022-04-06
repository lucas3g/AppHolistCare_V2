import 'dart:async';

import 'package:app_holist_care/app_widget.dart';
import 'package:app_holist_care/src/core/inject.dart';
import 'package:flutter/material.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      Inject.init();

      runApp(const AppWidget());
    },
    (error, st) => print(error),
  );
}
