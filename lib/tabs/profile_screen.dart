import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';
import '../auth/custom_text_form_field.dart';

// Assuming the CustomTextFormField and MyValidator are already defined

class ProfileScreen extends StatelessWidget {
  static const String routeName = 'profile_screen';

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController mobileController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    return Scaffold(
      backgroundColor: Appcolors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Image.asset('assets/images/route.png'),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Welcome , Ayat',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Appcolors.whiteColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'ayat.salah.eldin@gmail.com',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Appcolors.whiteColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your Full Name",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Appcolors.primaryColor,
              ),
            ),
          ),
          CustomTextFormField(
            label: '',
            controller: nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
            suffixIcon: Icon(Icons.edit, color: Appcolors.primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your E-mail",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Appcolors.primaryColor,
              ),
            ),
          ),
          CustomTextFormField(
            label: '',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            suffixIcon: Icon(Icons.edit, color: Appcolors.primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your password",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Appcolors.primaryColor,
              ),
            ),
          ),
          CustomTextFormField(
            label: '',
            controller: passwordController,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            suffixIcon: Icon(Icons.edit, color: Appcolors.primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your mobile number",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Appcolors.primaryColor,
              ),
            ),
          ),
          CustomTextFormField(
            label: '',
            controller: mobileController,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your mobile number';
              }
              return null;
            },
            suffixIcon: Icon(Icons.edit, color: Appcolors.primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your Address",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Appcolors.primaryColor,
              ),
            ),
          ),
          CustomTextFormField(
            label: '',
            controller: addressController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
            suffixIcon: Icon(Icons.edit, color: Appcolors.primaryColor),
          ),
        ],
      ),
    );
  }
}
