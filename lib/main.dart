import 'package:flutter/material.dart';
import 'package:food/screen/tabs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 241, 101, 101),
      brightness: Brightness.dark),
  textTheme: GoogleFonts.robotoTextTheme(),
);

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: SafeArea(
        child: const TabsScreen(),
      ),
      // theme: theme,
      // home: const TabsScreen(),
    );
  }
}
