import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/internet_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is InternetNotConnectedState) {
            return _buildTextWidget('Not Connected');
          } else if (state is InternetConnectedState) {
            return _buildTextWidget('Connected');
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildTextWidget(String message) {
    return Center(child: Text(message, style: const TextStyle(fontSize: 30)));
  }
}
