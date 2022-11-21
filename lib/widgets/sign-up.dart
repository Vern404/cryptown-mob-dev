import 'package:drc_cryptown/service/user/user-service.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

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

      if (res['ErrorCode'] == null) {
        Navigator.of(context).pushNamed('/crypto-list');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${res['Message']}'),
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
            Image.asset('assets/image/logo.png',fit: BoxFit.cover,height: 250,),
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
                            PatternValidator(r'(?=.*?[0-9])', errorText: 'Need at least 1 number'),
                          ]),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Userame',
                            hintText: 'john123',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: emailController,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                            EmailValidator(errorText: "Enter valid email format"),
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
                            PatternValidator(r'(?=.*?[0-9])', errorText: 'Need at least 1 number')
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
                          ElevatedButton(
                              onPressed: Register,
                              child: Text('Sign Up')),
                          TextButton(
                              onPressed: (){
                                Navigator.of(context).pushNamed('/sign-in');
                                print("Return to sign in page");
                              },
                              child: Text('Login')),
                        ],
                      ),

                    ],
                  ),
            ),
    ])
    )

    );
  }
}
