import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_regist/login.dart';
import 'package:login_regist/screen/tabs.dart';

import 'login_or_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot) {
          //user logged in
          if(snapshot.hasData){
            return const TabsScreen();
          }
          
          //user not logged in
          else{
            return const LoginOrRegisterPage();
          }
        },

      ),
    );
  }
}