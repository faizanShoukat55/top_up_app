import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/top_up_bloc.dart';
import '../blocs/top_up_event.dart';
import '../blocs/top_up_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Top-Up Beneficiaries")),
      body: BlocBuilder<TopUpBloc, TopUpState>(
        builder: (context, state) {
          if (state is BeneficiariesLoaded) {
            if (state.beneficiaries.isEmpty) {
              return Center(child: Text("No beneficiaries found."));
            }
            return ListView.builder(
              itemCount: state.beneficiaries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.beneficiaries[index].nickname),
                  subtitle: Text(state.beneficiaries[index].phoneNumber),
                );
              },
            );
          } else if (state is TopUpFailure) {
            return Center(child: Text("Error: ${state.error}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TopUpBloc>().add(LoadBeneficiaries());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
