
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'example@example.com.my',
              hintText: 'Enter valid email address',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              hintText: 'Enter secure password',
            ),
          )
        ],
      ),
    );
  }
}
