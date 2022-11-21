
import 'package:drc_cryptown/service/user/user-service.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class signIn extends StatefulWidget {
  const signIn({Key? key}) : super(key: key);

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  //form key to identify the form and validate
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#&*~]).{8,}$');
  //?=.*?[A-Z] - contain caps character from range A to Z
  //?=.*?[a-z] - contain letter from range a to z
  //?=.*?[0-9] - contain number from range 0 to 9
  //?=.*[!****] - allow special characters
  //{8,} at least 8 characters

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //get the api service
  final UserService _apiClient = UserService();

  Future<void> login() async {
    if (formkey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      Map<String, dynamic> userData = {
        "email":_emailController.text,
        "password": _passwordController.text,
      };

      dynamic res = await _apiClient.login(userData);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      String accessToken = res["userJwt"];

      if (accessToken != null) {
        // sharedPreferences.setString("userJWT",  res['userJWT']);
        // String accessToken = res['userJWT'];
        Navigator.of(context).pushNamed('/crypto-list');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login Failed'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child:Column(
        children: [
        Image.asset('assets/image/logo.png',fit: BoxFit.cover,height: 300,),
        Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkey,
            child: Column(
              children:<Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      validator: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                        EmailValidator(errorText: "Enter valid email format"),
                      ]),
                      controller: _emailController,
                      decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Address',
                      hintText: 'example@example.com.my',

                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      MinLengthValidator(8, errorText: "* Password should be at least 8 character"),
                      PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'Need at least 1 special character'),
                      PatternValidator(r'(?=.*?[a-z])', errorText: 'Need at least 1 lower case letter'),
                      PatternValidator(r'(?=.*?[A-Z])', errorText: 'Need at least 1 upper case letter'),
                      PatternValidator(r'(?=.*?[0-9])', errorText: 'Need at least 1 number')
                    ]),
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: login,
                        child: Text('Login')),
                    TextButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed('/sign-up');
                          print("Success enter sign up page");
                        },
                        child: Text('Sign Up'))
                  ],
                ),

              ],
        ),

    )
        ])
    )
    );
  }
}
