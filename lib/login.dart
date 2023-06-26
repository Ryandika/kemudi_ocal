import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_regist/components/button.dart';
import 'package:login_regist/components/textfield.dart';

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

    //validasi
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

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontrolller.text,
      );

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      // showErrorMessage(e.code);
      // show error message
      switch (e.code) {
        case "weak-password":
          showErrorMessage("Kata Sandi minimal 6 karakter alfanumerik");
          break;
        case "invalid-email":
          showErrorMessage("Masukan format email yang benar");
          break;
        case "user-not-found":
          showErrorMessage("Pengguna tidak ditemukan");
          break;
        case "wrong-password":
          showErrorMessage("Kata Sandi salah");
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


  // String? get emailError {
  //   // at any time, we can get the text from _controller.value.text
  //   final text = emailcontroller.text;
  //   // Note: you can do your own custom validation here
  //   // Move this logic this outside the widget for more testable code
  //   if (emailcontroller.value == null || emailcontroller.text.trim().isEmpty ||
  //                                 emailcontroller.text.contains('@')) {
  //     return 'Can\'t be empty';
  //   }
  //   if (text.length < 4) {
  //     return 'Too short';
  //   }
  //   // return null if the text is valid
  //   return null;
  // }

//  if (emailcontroller.value == null || emailcontroller.value.trim().isEmpty ||
//                                   emailcontroller.!value.contains('@')){
//                                     return 'Harap isi email yang valid'
//                                   };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 50),
                
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
                const SizedBox(height: 20),
                //text
                Text(
                  'Halo, Selamat Datang!',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                
                const SizedBox(height: 10),
                
                //textfield
                MyTextfield(
                  controller: emailcontroller,
                  label: const Text('Email'),
                  obscureText: false,
                  inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
                                  
                  // ,
                ),
                
                const SizedBox(height: 10),
                
                MyTextfield(
                  controller: passwordcontrolller,
                  label: const Text('Kata Sandi'),
                  obscureText: true,
                  inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
                ),
                
                const SizedBox(height: 20),
                
                MyButton(
                  text: "Masuk",
                  onTap: loginUserIn,
                ),
                
                const SizedBox(height: 20),
                
                //lanjutkan dengan
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Divider(
                //           thickness: 0.5,
                //           color: Colors.grey[400],
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //         child: Text(
                //           'Atau lanjutkan dengan',
                //           style: TextStyle(color: Colors.grey[700]),
                //         ),
                //       ),
                //       Expanded(
                //         child: Divider(
                //           thickness: 0.5,
                //           color: Colors.grey[400],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                
                // const SizedBox(height: 30),
                
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     // google button
                //     MySquareBtn(
                //         onTap: () {
                //           AuthService().signInWithGoogle();
                //         },
                //         imagePath: 'lib/images/googleicon.png'),
                //   ],
                // ),
                
                // const SizedBox(height: 10),
                
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
