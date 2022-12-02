
import 'package:drc_cryptown/service/user/user-service.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final UserService _apiClient = UserService();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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

  late String accesstoken;

  Future<Map<String, dynamic>> getUserData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    accesstoken = _prefs.getString("userJwt")!;
    dynamic userRes;
    userRes = await _apiClient.getUserProfileData('$accesstoken');
    return userRes;
  }

  Future<void> update() async {
    if (formkey.currentState!.validate()) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Processing Data'),
      backgroundColor: Colors.green.shade300,
    ));

    Map<String, dynamic> userData = {
      'username' : usernameController.text,
      'password' : passwordController.text,
      'confirm_password': confirmPasswordController.text,
    };

    dynamic res = await _apiClient.updateUserProfile(accessToken: accesstoken, data: userData);

    if (res['userJwt'] == null) {
      print(res);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Profile Updated Succefully'),
        backgroundColor: Colors.green.shade300,
      ));
      Navigator.of(context).pushNamed('/crypto-list');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: ${res['mssg']}'),
        backgroundColor: Colors.red.shade300,
      ));
    }}
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
            future: getUserData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: size.height,
                    width: size.width,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                String username = snapshot.data!['username'];
                String email = snapshot.data!['email'];

                return Container(
                  width: size.width,
                  height: size.height,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                border: Border.all(
                                    width: 1, color: Colors.blue.shade100),
                              ),
                              child: Container(
                                height: 100,
                                width: 100,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: const Image(
                                    image: AssetImage('assets/image/logo.png'),
                                    fit: BoxFit.fitWidth),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              username,
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              email,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white60),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            alignment: Alignment.center,
                            width: size.width,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(127, 156, 200, 1.0),
                                borderRadius: BorderRadius.circular(5)),
                            child: const Text('PROFILE DETAILS',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700)),
                          ),
                          const SizedBox(height: 20),
                          Form(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            key: formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                  initialValue: 'Email: ${email}',
                                  enabled: false,
                                  decoration: InputDecoration(
                                    fillColor: Color.fromRGBO(127, 156, 200, 0.5),
                                    filled: true,
                                    border: OutlineInputBorder(),
                                    // labelText: 'Email',
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: usernameController,
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "* Required"),
                                    MaxLengthValidator(50, errorText: "Max is 50 character"),
                                    PatternValidator(r'(^\S*$)', errorText: 'No whitespace allowed'),
                                    PatternValidator(r'(^[^#?!@$%^&*-<()>]*$)', errorText: 'No special character allowed')
                                  ]),
                                  decoration: InputDecoration(
                                    fillColor: Color.fromRGBO(127, 156, 200, 0.75),
                                    filled: true,
                                    border: OutlineInputBorder(),
                                    labelText: 'Username',
                                    hintText: 'new username',
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
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
                                    fillColor: Color.fromRGBO(127, 156, 200, 0.75),
                                    filled: true,
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
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: confirmPasswordController,
                                  validator: (value) => MatchValidator(errorText: 'Password do not match').validateMatch(value!, passwordController.text ),
                                  obscureText: _isHidden2,
                                  decoration: InputDecoration(
                                    fillColor: Color.fromRGBO(127, 156, 200, 0.75),
                                    filled: true,
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
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),
                          Container(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              //update profile function call
                              onPressed: update,
                              style: TextButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(49, 109, 255, 1.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 25)),
                              child: const Text(
                                'Update Profile',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                debugPrint(snapshot.error.toString());
              }
              return const SizedBox();
            },
          )
    );
  }
 }
