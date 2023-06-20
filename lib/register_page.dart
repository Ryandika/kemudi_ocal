import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_regist/components/button.dart';
import 'package:login_regist/components/textfield.dart';
import 'package:login_regist/components/square_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_regist/services/google_auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class _RegisterPageState extends State<RegisterPage> {
  final emailcontroller = TextEditingController();
  final passwordcontrolller = TextEditingController();
  final confirmPassController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final ageController = TextEditingController();

  void SignUserUp() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try create user
    try {
      // check if password is confirmed
      if (passwordcontrolller.text == confirmPassController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text,
          password: passwordcontrolller.text,
        );

        //add user details
        addUserDeatils(
          firstnameController.text.trim(), 
          lastnameController.text.trim(),
          int.parse(ageController.text.trim()),
          emailcontroller.text.trim(),
        );

      } else {
        //show  error message
        showErrorMessage("Password Tidak Cocok");
      }

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      //show error message
      showErrorMessage(e.code);
    }
  }

  Future addUserDeatils(
      String firstName, String lastName, int age, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'age': age,
      'email': email,
    });
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
                const SizedBox(height: 25),

                // logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.car_repair,
                      size: 60,
                      color: Colors.blue.shade600,
                    ),

                    Text(
                      'Kemudi',
                      style: TextStyle(
                          color: Colors.blue.shade600,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                //text
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(
                    'Selamat datang, Silahkan masukan data Anda!',
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 14,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                //--textfield
                MyTextfield(
                  controller: firstnameController,
                  hintText: 'First Name',
                  obscureText: false,
                ),
                const SizedBox(height: 5),

                MyTextfield(
                  controller: lastnameController,
                  hintText: 'Last Name',
                  obscureText: false,
                ),
                const SizedBox(height: 5),

                MyTextfield(
                  controller: ageController,
                  hintText: 'Age',
                  obscureText: false,
                ),
                const SizedBox(height: 5),

                //email
                MyTextfield(
                  controller: emailcontroller,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 5),

                //password
                MyTextfield(
                  controller: passwordcontrolller,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 5),

                //confirm password
                MyTextfield(
                  controller: confirmPassController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                const SizedBox(height: 20),

                MyButton(
                  text: "Daftar",
                  onTap: SignUserUp,
                ),

                const SizedBox(height: 20),

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

                const SizedBox(height: 10),

                //register now

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        " Masuk",
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
