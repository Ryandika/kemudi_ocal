import 'package:flutter/material.dart';
import 'package:login_regist/main.dart';
import 'package:login_regist/widgets/card_stack.dart';

class TrafficSignScreen extends StatelessWidget {
  const TrafficSignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rambu Lalu Lintas'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      body: Stack(
        children: const [
          CardsStackWidget(),
        ],
      ),
    );
  }
}
