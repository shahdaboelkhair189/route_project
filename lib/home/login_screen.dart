import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_project/app_colors.dart';
import 'package:route_project/auth/register/sign_up.dart';
import 'package:route_project/home/cubit/login_states.dart';
import 'package:route_project/utils/dialog_utils.dart';

import 'cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LoginScreen> {
  LoginCubit cubit = LoginCubit();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      bloc: cubit,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(
            context: context,
            loadingLabel: 'Waiting...',
          );
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              content: state.errorMessage,
              title: 'Error',
              posActionName: 'ok');
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              content: 'Login Successfully',
              title: 'Success',
              posActionName: 'ok');
        }
      },
      child: Scaffold(
        backgroundColor: Appcolors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: cubit.formKey,
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
                  controller: cubit.emailController,
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
                TextFormField(
                  controller: cubit.passwordController,
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

                    //to make it unseen first
                    suffixIcon: IconButton(
                      icon: Icon(
                        cubit.isObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          cubit.isObscure = !cubit.isObscure;
                        });
                      },
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
                  keyboardType: TextInputType.phone,
                  obscureText: !cubit.isObscure,
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
                Align(
                  alignment: Alignment.center, // Center the button horizontally
                  child: ElevatedButton(
                    onPressed: () {
                      cubit.login();
                    },
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Appcolors.primaryColor,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(398, 64),
                      backgroundColor: Appcolors.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
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
      ),
    );
  }
}
