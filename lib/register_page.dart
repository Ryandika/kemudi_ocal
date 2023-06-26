import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_regist/components/button.dart';
import 'package:login_regist/components/textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailcontroller = TextEditingController();
  final passwordcontrolller = TextEditingController();
  final confirmPassController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final ageController = TextEditingController();
  String? score = '';

  void signUserUp() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    if (firstnameController.text.isEmpty) {
      Navigator.pop(context);
      //show  error message
      showErrorMessage("Nama Depan tidak boleh kosong");
      return;
    }
    if (lastnameController.text.isEmpty) {
      Navigator.pop(context);
      //show  error message
      showErrorMessage("Nama Belakang tidak boleh kosong");
      return;
    }
    if (ageController.text.isEmpty) {
      Navigator.pop(context);
      //show  error message
      showErrorMessage("Umur tidak boleh kosong");
      return;
    }
    if (emailcontroller.text.isEmpty) {
      Navigator.pop(context);
      //show  error message
      showErrorMessage("Email tidak boleh kosong");
      return;
    }
    if (passwordcontrolller.text.isEmpty) {
      Navigator.pop(context);
      //show  error message
      showErrorMessage("Kata Sandi tidak boleh kosong");
      return;
    }
    if (passwordcontrolller.text != confirmPassController.text ||
        confirmPassController.text.isEmpty) {
      Navigator.pop(context);
      //show  error message
      showErrorMessage("Kata Sandi Tidak Cocok");
      return;
    }

    try {
      //create user
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontrolller.text,
      );

      //create document in firestore
      FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'username': emailcontroller.text.split('@')[0],
        'nama depan': firstnameController.text,
        'nama belakang': lastnameController.text,
        'age': ageController.text,
        'email': emailcontroller.text,
      });

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading
      Navigator.pop(context);
      //show error message
      // showErrorMessage(e.code);

      switch (e.code) {
        case "weak-password":
          showErrorMessage("Kata Sandi minimal 6 karakter alfanumerik");
          break;
        case "invalid-email":
          showErrorMessage("Masukan format email yang benar");
          break;
        case "email-already-in-use":
          showErrorMessage("Email sudah digunakan");
          break;
        default:
          showErrorMessage("Masukan data akun dengan benar");
      }
    }
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(child: Text(message)),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),

                // logo
                Icon(
                  Icons.car_repair,
                  size: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  'Kemudi',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),

                const SizedBox(height: 15),

                //text
                Text(
                  'Selamat datang,\nSilakan masukan data diri Anda!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.normal,
                      ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: MyTextfield(
                        controller: firstnameController,
                        label: const Text('Nama Depan'),
                        obscureText: false,
                        inputFormatters:
                            FilteringTextInputFormatter.singleLineFormatter,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: MyTextfield(
                        controller: lastnameController,
                        label: const Text('Nama Belakang'),
                        obscureText: false,
                        inputFormatters:
                            FilteringTextInputFormatter.singleLineFormatter,
                      ),
                    ),
                  ],
                ),
                //--textfield

                MyTextfield(
                  controller: ageController,
                  label: const Text('Umur'),
                  obscureText: false,
                  inputFormatters: FilteringTextInputFormatter.digitsOnly,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 5),

                //email
                MyTextfield(
                  controller: emailcontroller,
                  label: const Text('Email'),
                  obscureText: false,
                  inputFormatters:
                      FilteringTextInputFormatter.singleLineFormatter,
                ),
                const SizedBox(height: 5),

                //password
                MyTextfield(
                  controller: passwordcontrolller,
                  label: const Text('Kata Sandi'),
                  obscureText: true,
                  inputFormatters:
                      FilteringTextInputFormatter.singleLineFormatter,
                ),
                const SizedBox(height: 5),

                //confirm password
                MyTextfield(
                  controller: confirmPassController,
                  label: const Text('Konfirmasi Kata Sandi'),
                  obscureText: true,
                  inputFormatters:
                      FilteringTextInputFormatter.singleLineFormatter,
                ),

                const SizedBox(height: 20),

                MyButton(
                  text: "Daftar",
                  onTap: signUserUp,
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 20),
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
