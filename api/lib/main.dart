import 'package:api/auth/login_status.dart';
import 'package:api/auth/store.dart';
import 'package:api/ui/home.dart';
import 'package:api/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => LoginStatus())),
      ChangeNotifierProvider(create: ((context) => Store())),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laravel API',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Laravel API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    bool status = Provider.of<LoginStatus>(context).status;
    return Scaffold(
        body: (status)
            ? Container(
                child: Home(),
              )
            : Container(
                child: LoginScreen(),
              ));
  }
}
