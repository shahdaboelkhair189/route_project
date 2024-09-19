import 'package:flutter/material.dart';
import 'package:route_project/app_colors.dart';
import 'package:route_project/auth/register/sign_up.dart';

import 'homee.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';
  final TextEditingController emailController =
      TextEditingController(text: 'shahd@route.com');
  final TextEditingController passwordController =
      TextEditingController(text: '123456');
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/route.png'),
              ),
              SizedBox(height: 50.0),
              Text('Welcome Back To Route',
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              Text('Please sign in with your mail',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              SizedBox(height: 30.0),
              Text('User name',
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              SizedBox(height: 20.0),
              TextFormField(
                controller: emailController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter an email';
                  }
                  final bool emailValid = RegExp(
                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                  ).hasMatch(value);
                  if (!emailValid) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30.0),
              Text('Password',
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              SizedBox(height: 20.0),
              TextFormField(
                controller: passwordController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 10.0),
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot password?",
                        style: TextStyle(color: Colors.white70, fontSize: 20))
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      Navigator.of(context).pushNamed(Homee.routeName);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Appcolors.whiteColor,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(3.6),
                      side: BorderSide(
                        color: Appcolors.primaryColor,
                        width: 0.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  child: Text("LOG IN",
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(SignUp.routeName);
                  },
                  child: Text("Don't have an account? Create Account",
                      style: TextStyle(color: Colors.white70, fontSize: 17)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
