import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up_app/core/utils/enums.dart';
import '../blocs/home/home_cubit.dart';
import '../blocs/home/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Top-Up Beneficiaries")),

      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.viewState == ViewState.loaded) {
            if (state.topUpList?.isEmpty??true) {
              return const Center(child: Text("No Top Up found."));
            }
            return ListView.builder(
              itemCount: state.topUpList?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.topUpList?[index].beneficiaryName??"N/A"),
                  subtitle: Text(state.topUpList?[index].accountNumber??"N/A"),
                );
              },
            );
          } else if (state.viewState == ViewState.error) {
            return Center(child: Text("Error: ${state.error}"));
          } else if (state.viewState == ViewState.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
