// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:agents_of_valorant/home/home.dart';
import 'package:agents_of_valorant/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          // color: Color(0xFF0e1922),
          color: Colors.transparent,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF0e1922),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
