import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/sing_in/bloc/sing_in_blocs.dart';

class SingInController {
  final BuildContext context;

  const SingInController({required this.context});

  Future<void> handleSingIn(String type) async {
    try {
      if (type == "email") {
        // BlocProvider.of<SingInBloc>(context).state
        final state = context.read<SingInBloc>().state;
        String password = state.password;
        String emailAddress = state.email;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "yor need to fill email address");
          return;
        } else {
          print("email is $emailAddress");
        }
        if (password.isEmpty) {
          toastInfo(msg: "yor need to fill password");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password,
          );
          if (credential.user == null) {
            toastInfo(msg: "yor don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            //
            toastInfo(msg: "yor need to verify your email account");
            // return;
          }

          var user = credential.user;
          if (user != null) {
            print('user exist');
            Global.storageService.setString((AppConstants.STORAGE_USER_TOKEN_KEY), "12345678");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
            //we  got error getting user from firebase
          } else {
            toastInfo(msg: "Currently your are not a user of this app");
            return;
            // we have error getting user from firebase
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
            toastInfo(msg: "No user found for that email.");
            // toastInfo(mag: "No user found for that email.")
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
            toastInfo(msg: "Wrong password provided for that user.");
            // toastInfo(mag: "Wrong password provided for that user.")
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Your email address format is wrong");
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
