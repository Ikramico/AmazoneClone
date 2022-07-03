import 'dart:ffi';

import 'package:amazone_demo/common/widgets/custombutton.dart';
import 'package:amazone_demo/common/widgets/customtext.dart';
import 'package:amazone_demo/constants/globe.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpKey = GlobalKey<FormState>();
  final _signInKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  dispose() {
  
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text(
                'Welcome to Habijabi',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                tileColor: _auth == Auth.signup? GlobalVariables.backgroundColor :
                GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Create a new Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpKey,
                    child: Column(children: [
                      CustomTextFeild(controller: _emailController,
                      HintText: 'Email',
                      ),
                      const SizedBox(height: 10,),
                      CustomTextFeild(controller: _nameController,
                      HintText: 'Name',
                      ),
                      const SizedBox(height: 10,),
                      CustomTextFeild(controller: _passwordController,
                      HintText: 'Password',
                      ),
                      const SizedBox(height: 10,),
                      CustomButton(text: 'Sign In', onTap: () {})
                    ]),
                  ),
                ),
              ListTile(
                  tileColor: _auth == Auth.signin? GlobalVariables.backgroundColor :
                GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpKey,
                    child: Column(children: [
                      CustomTextFeild(controller: _emailController,
                      HintText: 'Email',
                      ),

                      const SizedBox(height: 10,),
                      CustomTextFeild(controller: _passwordController,
                      HintText: 'Password',
                      ),
                      const SizedBox(height: 10,),
                      CustomButton(text: 'Sign In', onTap: () {})
                    ]),
                  ),
                ),
            ],
          ),
        ),
      )),
    );
  }
}
