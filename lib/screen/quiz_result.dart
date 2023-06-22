import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_regist/main.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.result,
    required this.questionLength,
    this.onTap,
  });

  final int result;
  final int questionLength;
  final Function()? onTap;

  void userOut() {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.onPrimary,
        foregroundColor: colorScheme.onPrimaryContainer,
        elevation: 0,

        // actions: [
        //   IconButton(onPressed: userOut, icon: const Icon(Icons.logout)),
        // ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Hasil',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.black),
              const SizedBox(height: 10),
              Text(
                '$result dari total $questionLength pertanyaan terjawab benar!',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              const CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 180,
              ),
              const SizedBox(height: 40),

              //button mulai
              GestureDetector(
                onTap: onTap,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(color: colorScheme.inversePrimary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text('Mulai ulang',
                        style: TextStyle(
                            color: colorScheme.onPrimaryContainer,
                            fontSize: 18))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
