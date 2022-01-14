import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'mycounter.dart';

class MyDialog {
  Future<void> showMyDialog(BuildContext context, WidgetRef ref, Counter counter) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.topCenter,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  ref.watch(counterProvider);
                  ref.read(counterProvider.notifier).state++;

                  ref.watch(counter.counterStateProvider);
                  ref.read(counter.counterStateProvider.state).state++;
                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
