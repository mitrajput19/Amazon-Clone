import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth {
  signup,
  signin,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  Auth _auth = Auth.signup;
  final _signupFormKey = GlobalKey();
  final _signinFormKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              tileColor: (_auth==Auth.signup)? GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? val){
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
              title: const Text(
                "Create Account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if(_auth==Auth.signup)
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: Form(
                  key: _signupFormKey,
                  child: Column(
                    children: [
                      CustomTextField(controller: _nameController, hintText: 'Name',),
                      const SizedBox(height: 10,),
                      CustomTextField(controller: _emailController, hintText: 'Email',),
                      const SizedBox(height: 10,),
                      CustomTextField(controller: _passwordController, hintText: 'Password',),
                      const SizedBox(height: 10,),
                      CustomButton(text: "Sign up", onTap: (){

                      })
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: (_auth==Auth.signin)? GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundCOlor,
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? val){
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
              title: const Text(
                "Sign-in",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if(_auth==Auth.signin)
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: Form(
                  key: _signupFormKey,
                  child: Column(
                    children: [
                      CustomTextField(controller: _emailController, hintText: 'Email',),
                      const SizedBox(height: 10,),
                      CustomTextField(controller: _passwordController, hintText: 'Password',),
                      const SizedBox(height: 10,),
                      CustomButton(text: "Sign in", onTap: (){

                      })
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
