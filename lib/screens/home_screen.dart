import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/counter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterAction = context.read<CounterBloc>();
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          final counterState = state as CounterInitial;
          return Padding(
            padding: EdgeInsets.fromLTRB(40.0, 1.2 * kToolbarHeight, 40.0, 20),
            child: Center(
              child: Text(
                counterState.count.toString(),
                style: TextStyle(color: Colors.white, fontSize: 48.0),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counterAction.add(CounterIncrementPressed()),
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10.0),
          FloatingActionButton(
            onPressed: () => counterAction.add(CounterDecrementPressed()),
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
