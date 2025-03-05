import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homzes_app/feature/home/presentation/bloc/home_di.dart';
import 'package:homzes_app/feature/home/presentation/pages/welcome_screen.dart';
import 'package:homzes_app/firebase_options.dart';

import 'feature/home/presentation/bloc/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (_) =>
              HomeBloc(homeFetchProperties: HomeInject.homeFetchProperties)
                ..add(FetchPropertiesEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Homzes App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme:
              GoogleFonts.robotoFlexTextTheme(Theme.of(context).textTheme),
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
