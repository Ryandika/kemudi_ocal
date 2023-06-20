import 'package:flutter/material.dart';
import '../widgets/list_kursus.dart';


class FindPage extends StatelessWidget {
  const FindPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temukan"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          ListKursus(),
        ],
      ),
    );
  }
}
