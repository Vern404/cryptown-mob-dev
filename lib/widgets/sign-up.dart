import 'package:drc_cryptown/service/user/user-service.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final UserService _apiClient = UserService();

  bool _isHidden1 = true;
  void _togglePassword() {
    setState(() {
      _isHidden1 = !_isHidden1;
    });
  }

  bool _isHidden2 = true;
  void _toggleConfirmPassword() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }

  Future<void> Register() async {
    if (formkey.currentState!.validate()) {
      //show snackbar to indicate loading
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      //the user data to be sent
      Map<String, dynamic> userData = {
        "email": emailController.text,
        "username": usernameController.text,
        "password": passwordController.text,
        "confirm_password": confirmPasswordController.text,
      };

      dynamic res = await _apiClient.registerUser(userData);

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
              const SizedBox(height: 50),
              Image.asset('assets/image/logo.png',
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
                height: 100,),
              const SizedBox(height: 50),
              Text('SIGN UP',
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
              const SizedBox(height: 15),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: usernameController,
                            validator: MultiValidator([
                              RequiredValidator(errorText: "* Required"),
                              MaxLengthValidator(50, errorText: "Max is 50 character"),
                              PatternValidator(r'(^\S*$)', errorText: 'No whitespace allowed'),
                              PatternValidator(r'(^[^#?!@$%^&*-<()>{}]*$)', errorText: 'No special character allowed')
                            ]),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Userame',
                              hintText: 'John123',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: emailController,
                            validator: MultiValidator([
                              RequiredValidator(errorText: "* Required"),
                              MaxLengthValidator(100, errorText: "Max character is 100"),
                              EmailValidator(errorText: "Enter valid email format"),
                              PatternValidator(r'(^[\w\d.@]+$)', errorText: 'Only period allowed')
                            ]),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email Address',
                              hintText: 'example@example.com.my',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: passwordController,
                            validator: MultiValidator([
                              RequiredValidator(errorText: "* Required"),
                              MinLengthValidator(8, errorText: "* Password should be at least 8 character"),
                              PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'Need at least 1 special character'),
                              PatternValidator(r'(?=.*?[a-z])', errorText: 'Need at least 1 lower case letter'),
                              PatternValidator(r'(?=.*?[A-Z])', errorText: 'Need at least 1 upper case letter'),
                              PatternValidator(r'(?=.*?[0-9])', errorText: 'Need at least 1 number'),
                              PatternValidator(r'(^\S*$)', errorText: 'No whitespace allowed'),
                            ]),
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
                              ),),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: confirmPasswordController,
                            validator: (value) => MatchValidator(errorText: 'Password do not match').validateMatch(value!, passwordController.text ),
                            obscureText: _isHidden2,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Confirm Password',
                              hintText: 'Re-enter Password again',
                              suffix: InkWell(
                                onTap: _toggleConfirmPassword,
                                child: Icon(
                                  _isHidden2
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                            ),),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(height: 20),
                            Column(
                              children: [
                                Text('By signing up, you’re agree to our',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      )
                                  ),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Terms & Conditions ',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),),
                                    Text('and ',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          )
                                      ),),
                                    Text('Privacy Policy',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                                onPressed: Register,
                                child: Text('Sign Up')),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Already user?'),
                                TextButton(
                                    onPressed: (){
                                      Navigator.of(context).pushNamed('/sign-in');
                                    },
                                    child: Text('Login')),
                                Text('here'),
                              ],
                            ),

                          ],
                        ),

                      ],
                    ),
              ),
      ])
      )

      )),
    );
  }
}
