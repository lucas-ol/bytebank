import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  const Progress({super.key, this.message = "Loading"});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const CircularProgressIndicator(), Text(message)]),
    );
  }
}
