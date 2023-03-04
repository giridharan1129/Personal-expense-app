import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './quiz_app/quiz_main.dart';
import './personal_expenses_app/homepage.dart';
import './world_time/World_time_pages/choose_location.dart';
import './world_time/World_time_pages/home.dart';
import './world_time/World_time_pages/loading.dart';
import './world_time/world_time_services/world_time.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/loading': (context) => const Loading(),
        '/quiz_app': (context) => QuizApp(),
        '/expenses_app': (context) => PeHomePage(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Color.fromARGB(255, 127, 255, 7),
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black))),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Apps',
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/loading');
                  },
                  icon: const Icon(Icons.timer),
                  label: const Text('World time app')),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/quiz_app');
                  },
                  icon: const Icon(Icons.quiz),
                  label: const Text('Personality quiz app')),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/expenses_app');
                  },
                  icon: const Icon(Icons.wallet),
                  label: const Text('Expense app'))
            ],
          ),
        ),
      ),
    );
  }
}
