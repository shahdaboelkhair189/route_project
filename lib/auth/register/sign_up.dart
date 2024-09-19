import 'package:flutter/material.dart';

import '../../app_colors.dart';
import '../../home/homee.dart';

class SignUp extends StatefulWidget {
  static const String routeName = 'SignUp';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController(text: 'Shahd');
  var passwordController = TextEditingController(text: '123456');
  var confirmationPasswordController = TextEditingController(text: '123456');
  var emailController = TextEditingController(text: 'shahd@route.com');
  var phoneController = TextEditingController(text: '01010101010');
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
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
                Text(
                  'Full Name',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: nameController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter your full name',
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
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.0),
                Text(
                  'Mobile Number',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: phoneController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter your mobile number',
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
                      return 'Please enter your phone number';
                    }
                    if (value.length != 11) {
                      return 'Phone number must be 11 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.0),
                Text(
                  'E-mail Address',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: emailController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter your email address',
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
                      return 'Please enter your Email';
                    }
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if (!emailValid) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 30.0),
                Text(
                  'Password',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
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
                      return 'Please enter Password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 500,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Trigger form validation
                        if (formKey.currentState!.validate()) {
                          // If all fields are valid, navigate to the Homee screen
                          Navigator.of(context).pushNamed(Homee.routeName);
                        } else {
                          // Show error message if validation fails
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('Please fix the errors in the form')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolors.whiteColor,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          side: BorderSide(
                            color: Appcolors.primaryColor,
                            width: 0.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Text(
                        "Sign up",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
