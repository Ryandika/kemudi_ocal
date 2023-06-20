import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_regist/components/button.dart';
import 'package:login_regist/components/textfield.dart';
import 'package:login_regist/components/square_button.dart';
import 'package:login_regist/services/google_auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontrolller = TextEditingController();

  void loginUserIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontrolller.text,
      );

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      //show error message
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),

                // logo
                Icon(
                  Icons.car_repair,
                  size: 100,
                  color: Colors.blue.shade600,
                ),

                Text(
                  'Kemudi',
                  style: TextStyle(
                      color: Colors.blue.shade600,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 50),

                //text
                Text(
                  'Halo, Selamat Datang!',
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 30),

                //textfield
                MyTextfield(
                  controller: emailcontroller,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 20),

                MyTextfield(
                  controller: passwordcontrolller,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 30),

                MyButton(
                  text: "Masuk",
                  onTap: loginUserIn,
                ),

                const SizedBox(height: 50),

                //lanjutkan dengan
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Atau lanjutkan dengan',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    MySquareBtn(
                        onTap: () {
                          AuthService().signInWithGoogle();
                        },
                        imagePath: 'lib/images/googleicon.png'),
                  ],
                ),

                const SizedBox(height: 50),

                //register now

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        " Daftar",
                        style: TextStyle(
                            color: Colors.blue.shade600,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
