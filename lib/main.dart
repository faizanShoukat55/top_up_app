import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:top_up_app/presentation/blocs/home/home_cubit.dart';
import 'package:top_up_app/presentation/screens/home_screen.dart';

import 'dependency_injection.dart';

Logger logger = Logger();

void main() {
  /// Dependency Injection
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<HomeCubit>(),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
