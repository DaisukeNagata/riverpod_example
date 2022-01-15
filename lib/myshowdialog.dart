import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'mycounter.dart';

class MyDialog {
  showMyDialog(BuildContext context, WidgetRef ref, Counter counter) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              alignment: Alignment.topCenter,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                          ref.read(counterProvider.notifier).state++;
                          ref.read(counter.counterStateProvider.state).state++;
                      });
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                  Text(ref.watch(counterProvider).toString()),
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
      },
    );
  }
}
