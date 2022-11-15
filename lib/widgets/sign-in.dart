
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class signIn extends StatefulWidget {
  const signIn({Key? key}) : super(key: key);

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  //validation password
  validationPass (String _passError) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#&*~]).{8,}$');
    //?=.*?[A-Z] - contain caps character from range A to Z
    //?=.*?[a-z] - contain letter from range a to z
    //?=.*?[0-9] - contain number from range 0 to 9
    //?=.*[!****] - allow special characters
    //{8,} at least 8 characters

    if (_passError.isEmpty) {
      return "* Required";
    } else if (!regex.hasMatch(_passError)) {
      return "Invalid Password";
    } else {
      return "Valid Password";
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Form(
          // autovalidateMode: true,
          key: formkey,
          child: Column(
            children:<Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      EmailValidator(errorText: "Enter valid email id"),
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
                  // validator: validationPass(),
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
                      onPressed: (){
                        // if (formkey.currentState.validate()) {
                          Navigator.of(context).pushNamed('/crypto-list');
                          print("Validated");
                        // }else{
                        //   print("Not Validated");
                        // }
                      },
                      child: Text('Login')),
                  TextButton(
                      onPressed: (){
                        // if (formkey.currentState.validate()) {
                        Navigator.of(context).pushNamed('/sign-up');
                        print("Validated");
                        // }else{
                        //   print("Not Validated");
                        // }
                      },
                      child: Text('Sign Up'))
                ],
              ),

            ],
      ),
        ),
    );
  }
}
