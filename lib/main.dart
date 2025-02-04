import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up_app/presentation/blocs/top_up_bloc.dart';
import 'package:top_up_app/presentation/blocs/top_up_event.dart';
import 'package:top_up_app/presentation/screens/home_screen.dart';

import 'data/repositories/top_up_repository_impl.dart';
import 'domain/repositories/top_up_repository.dart';

void main() {
  // Initialize Repository
  final TopUpRepository topUpRepository = TopUpRepositoryImpl();

  runApp(MyApp(repository: topUpRepository));
}

class MyApp extends StatelessWidget {
  final TopUpRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopUpBloc(repository)..add(LoadBeneficiaries()),
      child: MaterialApp(
        title: 'Top-Up App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}