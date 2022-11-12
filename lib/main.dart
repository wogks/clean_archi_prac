import 'package:clean_archi_memo/presentation/notes/notes_screen.dart';
import 'package:clean_archi_memo/ui/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        backgroundColor: dartGray,
        canvasColor: dartGray,
        floatingActionButtonTheme:
            Theme.of(context).floatingActionButtonTheme.copyWith(
                  backgroundColor: Colors.white,
                  foregroundColor: dartGray,
                ),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
          backgroundColor: dartGray,
        ),
      ),
      home: const NotesScreen(),
    );
  }
}
