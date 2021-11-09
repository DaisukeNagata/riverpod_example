import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'main.dart';


class MyButton extends HookConsumerWidget {
  var app = MyApp();
  var st = "";
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Example')),
        body: Center(
          child: Text(st),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.watch(app.counterStateProvider);
            var number = ref.read(app.counterStateProvider.state).state++;
            st = number.toString();
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}