
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String password = '';
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                          ),
                          onChanged: (value){
                            password = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) => MatchValidator(errorText: 'Password do not match').validateMatch(value!, password),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                            hintText: 'Re-enter Password again',
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: (){
                                if (formkey.currentState!.validate()) {
                                Navigator.of(context).pushNamed('/crypto-list');
                                print("Validated");
                                }else{
                                  print("Not Validated");
                                }
                              },
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
