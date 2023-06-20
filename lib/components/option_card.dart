import 'package:flutter/material.dart';
import 'package:login_regist/main.dart';

class OptionsCard extends StatelessWidget {
  const OptionsCard({super.key, required this.optionCard, required this.colorCard});
  final String optionCard;
  final Color colorCard;


  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorCard,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          // side: const BorderSide(
          //   color: Colors.blue
          // )
        ),
      child: ListTile(
        title: Text(
          optionCard, style: 
          TextStyle(
            color: colorScheme.onPrimary,
            fontSize: 18,
          ),
        ),
        // tileColor: Colors.blue,
        
        
      ),
    );
  }
}