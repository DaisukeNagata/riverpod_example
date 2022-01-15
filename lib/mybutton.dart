import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_example/mycounter.dart';
import 'package:riverpod_example/myshowdialog.dart';

class MyButton extends HookConsumerWidget {

  Counter? counter = Counter();
  late var c = counter ?? Counter();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*
      example
      How to discard the Counter class and regenerate it,
      in this case you can process it by using Future and making it asynchronous
    */
    counter = ref.watch(c.counterStateProvider) > 5 ? null : counter;
    counter = ref.watch(counterProvider) > 6 ? c : counter;
    if (counter == null) {
      Future(() {
        ref.read(c.counterStateProvider.state).state = 0;
      });
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Example')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(ref.watch(counterProvider).toString()),
              counter == null ? Text("") : Text(ref.watch(c.counterStateProvider).toString()),
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            MyDialog().showMyDialog(context,ref,c);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}