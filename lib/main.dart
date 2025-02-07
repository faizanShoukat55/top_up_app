import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:top_up_app/presentation/blocs/beneficiary/beneficiary_cubit.dart';
import 'package:top_up_app/presentation/blocs/home/home_cubit.dart';
import 'package:top_up_app/presentation/blocs/top_up/top_up_cubit.dart';
import 'package:top_up_app/presentation/screens/home/home_screen.dart';

import 'core/utils/theme.dart';
import 'dependency_injection.dart';

Logger logger = Logger();

void main() {
  /// Dependency Injection
  init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomeCubit>()),
        BlocProvider(create: (context) => getIt<TopUpCubit>()),
        BlocProvider(create: (context) => getIt<BeneficiaryCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TopUp App',
      debugShowCheckedModeBanner: false,
      theme: getLightTheme(),
      home: const HomeScreen(),
    );
  }
}
