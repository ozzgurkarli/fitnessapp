import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/presentation/sign/signup.dart';

class DatabaseAuth {
  Future<void> createUser() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: SignUp.emailController.text,
            password: SignUp.passwordController.text);
    userCredential.user!.sendEmailVerification();
  }

  Future<void> signUser(String email, String password)async{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
      );
  }

  Future<void> resetPasswordMail(String email)async{
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
