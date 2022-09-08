import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_firebase/bloc_page/bloc_event.dart';
import 'package:todo_bloc_firebase/bloc_page/bloc_page.dart';
import 'package:todo_bloc_firebase/bloc_page/bloc_state.dart';
import 'package:todo_bloc_firebase/ui/home_screen.dart';
import 'package:todo_bloc_firebase/ui/login_screen.dart';
import 'package:todo_bloc_firebase/ui/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<BlocPage>(create: ((BuildContext context) => BlocPage()))
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BlocPage>(context).add(LoginEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<BlocPage, BlocState>(
        builder: (BuildContext context, state) {
      if (state is LoginState) {
        return LoginScreen();
      } else if (state is RegisterState) {
        return RegisterScreen();
      } else {
        return HomeScreen();
      }
    }));
  }
}
