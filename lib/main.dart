import 'package:clean_archi_memo/di/provider_setup.dart';
import 'package:clean_archi_memo/presentation/notes/notes_screen.dart';
import 'package:clean_archi_memo/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final providers = await getProviders();
  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        unselectedWidgetColor: Colors.white,
        primaryColor: Colors.white,
        backgroundColor: dartGray,
        canvasColor: dartGray,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white
        ),
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
