import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:learn_flutter_bloc/counter/bloc/counter_bloc.dart';
import 'package:learn_flutter_bloc/counter/widget/buttons.dart';

class CounterHomePage extends StatelessWidget {
  const CounterHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Bloc"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter Value is :',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (_, state) {
                return Text(
                  "${state.counterValue}",
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 30),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: const ButtonsWidget(),
    );
  }
}