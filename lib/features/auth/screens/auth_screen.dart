import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/custom_textfield.dart';

// enum Auth for signIn and signUp
enum Auth {
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  // routeName variable is used for Page Navigation
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // setting the _auth enum object to Auth.signup
  Auth _auth = Auth.signUp;
  // GlobalKey is used for the form
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                title: const Text(
                  'Create Account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signUp,
                  groupValue: _auth,
                  // the Auth? is when the group value changed the val will
                  // also change
                  onChanged: (Auth? val) {
                    setState(() {
                      // val! can never be null
                      _auth = val!;
                    });
                  }, // onChanged
                ),
              ),
              // Radio Button Select for signIn and signUp
              if (_auth == Auth.signUp)
                Form(
                  key: _signUpFormKey,
                  // Column Widgets for the Form Fields
                  child: Column(
                    children: [CustomTextField(controller: controller)],
                  ),
                ),

              ListTile(
                title: const Text(
                  'Sign in',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signIn,
                  groupValue: _auth,
                  // the Auth? is when the group value changed the val will
                  // also change
                  onChanged: (Auth? val) {
                    setState(() {
                      // val! can never be null
                      _auth = val!;
                    });
                  }, // onChanged
                ),
              ),
            ], // Column children[]
          ),
        ),
      ),
    );
  }
}
