
import 'package:drc_cryptown/service/user/user-service.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  bool _isHidden1 = true;

  void _togglePassword() {
    setState(() {
      _isHidden1 = !_isHidden1;
    });
  }

  //get the api service
  final UserService _apiClient = UserService();

  Future<void> login() async {
    if (formkey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      Map<String, dynamic> userData = {
        "email": _emailController.text,
        "password": _passwordController.text,
      };

      dynamic res = await _apiClient.login(userData);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res['user'] != null) {
        String accessToken = res["userJwt"];
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString('userJwt', accessToken);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${res['mssg']}'),
          backgroundColor: Colors.green.shade300,
        ));
        Navigator.of(context).pushNamed('/crypto-list');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${res['error']}'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: new BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xff242424),
            const Color(0xff3b0054),
            const Color(0xff00094b),
            const Color(0xff242424),
          ],),),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          body:SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
            Image.asset('assets/image/logo.png',fit: BoxFit.fitWidth,
              width: size.width,
              height: 100,),
            const SizedBox(height: 20),
            Text('Cleans A Big, Big Cryptocurrency For Less Than Half A Crown.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                )
              ),),
            const SizedBox(height: 50),
            Text('LOGIN',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )
              ),),
              const SizedBox(height: 5),
              Text('Always the best platform for learning crypto',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    )
                ),),
              const SizedBox(height: 30),
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
                        ]),
                        controller: _passwordController,
                        obscureText: _isHidden1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          suffix: InkWell(
                            onTap: _togglePassword,
                            child: Icon(
                              _isHidden1
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: login,
                            child: Text('Login')),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('New to Cryptown? '),
                            TextButton(
                                onPressed: (){
                                  Navigator.of(context).pushNamed('/sign-up');
                                  print("Success enter sign up page");
                                },
                                child: Text('Sign Up')),
                            Text('Now'),
                          ],
                        )
                      ],
                    ),

                  ],
            ),

      )
            ]),
          )
      )
      ),
    );
  }
}