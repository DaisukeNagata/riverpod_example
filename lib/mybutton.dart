import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_example/mycounter.dart';
import 'package:riverpod_example/myshowdialog.dart';

class MyButton extends HookConsumerWidget {

  var counter = Counter();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Example')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(ref.watch(counterProvider).toString()),
              Text(ref.watch(counter.counterStateProvider).toString()),
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            MyDialog().showMyDialog(context, ref, counter);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}