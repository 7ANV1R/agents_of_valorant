import 'package:agents_of_valorant/home/cubit/home_cubit.dart';
import 'package:agents_of_valorant/home/view/home_view.dart';
import 'package:agents_of_valorant/repositories/agent_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        AgentRepository(),
      ),
      // child: const HomeView(),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeError) {
              return const Center(child: Text('Error'));
            } else if (state is HomeLoaded) {
              return HomeView(
                apiResult: state.apiResult,
              );
            } else {
              return const Center(child: Text('Error'));
            }
          },
        ),
      ),
    );
  }
}
