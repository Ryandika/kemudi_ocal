import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {



  signInWithGoogle()async {

    //proses sign in
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //authentication
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //buat kredensial baru untuk user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
    );
    
    //masuk
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}