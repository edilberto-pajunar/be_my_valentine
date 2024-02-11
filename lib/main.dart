import 'package:be_my_valentine/config/theme/app_themes.dart';
import 'package:be_my_valentine/firebase_options.dart';
import 'package:be_my_valentine/src/injection_container.dart';
import 'package:be_my_valentine/src/presentation/bloc/photos/photo_bloc.dart';
import 'package:be_my_valentine/src/presentation/screens/app.dart';
import 'package:be_my_valentine/src/presentation/screens/bottom_bar/add.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PhotoBloc>(create: (context) => PhotoBloc(sl())),
      ],
      child: MaterialApp(
        theme: theme(),
        home: const AppScreen(),
      ),
    );
  }
}
