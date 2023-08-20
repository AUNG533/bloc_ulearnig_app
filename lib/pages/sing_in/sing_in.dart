import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/sing_in/bloc/sing_in_blocs.dart';
import 'package:ulearning_app/pages/sing_in/bloc/sing_in_events.dart';
import 'package:ulearning_app/pages/sing_in/bloc/sing_in_states.dart';
import 'package:ulearning_app/pages/sing_in/sing_in_controler.dart';
// import 'package:ulearning_app/pages/sing_in/widget/sing_in_widget.dart';
import 'package:ulearning_app/pages/common_widget.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingInBloc, SingInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Log In"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                      child: reusableText("Or use your email account login")),
                  Container(
                    margin: EdgeInsets.only(top: 66.h),
                    padding: EdgeInsets.only(left: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        const SizedBox(height: 5.0),
                        buildTextField(
                            "Enter your email address", "email", "user",
                            (value) {
                          context.read<SingInBloc>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        const SizedBox(height: 5.0),
                        buildTextField(
                            "Enter your password", "password", "lock", (value) {
                          context.read<SingInBloc>().add(PasswordEvent(value));
                        }),
                      ],
                    ),
                  ),
                  forgotPassword(),
                  buildLogInAdnRegButton("Log In", "login", () {
                    SingInController(context: context).handleSingIn("email");
                  }),
                  buildLogInAdnRegButton("Sign up", "register", () {
                    Navigator.of(context).pushNamed("/register");
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
