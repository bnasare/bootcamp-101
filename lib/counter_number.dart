import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';

class CounterNumber extends StatelessWidget {
  const CounterNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '${counter.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Future.delayed(const Duration(seconds: 3), () {
                counter.reset();
              });
            },
            child: const Text('Reset'),
          )
        ],
      ),
    );
  }
}
