import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galerimusik_klpk7/repositories/lcl_storage_repository.dart';
import 'package:galerimusik_klpk7/screens/dashboard_scrn/dashboard_scrn.dart';
import 'package:galerimusik_klpk7/service_locator.dart';
import 'package:theme_provider/theme_provider.dart';

import 'app_themes/app_themes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themes: appThemes,
      loadThemeOnInit: true,
      saveThemesOnChange: true,
      child: ThemeConsumer(
          child: Builder(
            builder: (context) => MaterialApp(
              builder: (context, child) {
                return ValueListenableBuilder(
                  valueListenable: serviceLocator
                      .get<LocalStorageRepository>()
                      .fontFactorListenable,
                  builder: (context, dynamic fontFactor, _) {
                    return MediaQuery(
                      child: child!,
                      data: MediaQuery.of(context).copyWith(
                        textScaleFactor: fontFactor,
                      ),
                    );
                  },
                );
              },
              theme: ThemeProvider.themeOf(context).data,
              home: Scaffold(
                body: DashboardScreen(),
              ),
            ),
          )),
    );
  }
}
