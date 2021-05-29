import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:lisiko_creative/services/auth.dart';
import 'package:lisiko_creative/services/database.dart';
import 'package:lisiko_creative/widgets/auth_input_decoration.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Image(
                  width: 80,
                  image: AssetImage('assets/images/one.png'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Create account',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      PhysicalModel(
                        color: Colors.white,
                        elevation: 20,
                        borderRadius: BorderRadius.circular(20),
                        child: TextFormField(
                          controller: usernameController,
                          keyboardType: TextInputType.text,
                          decoration: authInputDecoration('Username', Icon(
                            Icons.person,
                            color: Colors.black,
                          )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your email address';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PhysicalModel(
                        color: Colors.white,
                        elevation: 20,
                        borderRadius: BorderRadius.circular(20),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: authInputDecoration('Password', Icon(
                            Icons.lock,
                            color: Colors.black,
                          )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PhysicalModel(
                        color: Colors.white,
                        elevation: 20,
                        borderRadius: BorderRadius.circular(20),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: authInputDecoration('Email Address', Icon(
                            Icons.email,
                            color: Colors.black,
                          )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your name';
                            } else if (!EmailValidator.validate(value)) {
                              return 'Invalid Email Address';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PhysicalModel(
                        color: Colors.white,
                        elevation: 20,
                        borderRadius: BorderRadius.circular(20),
                        child: TextFormField(
                          controller: phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: authInputDecoration('Phone Number', Icon(
                            Icons.call,
                            color: Colors.black,
                          )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter phone number';
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Create',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: IconButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            dynamic result = await AuthService().register(
                                emailController.text, passwordController.text);

                            if (result == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(
                                      'Something went wrong!!! Please try again.')));
                            } else {
                              DatabaseService(uid: result.uid).updateUser(
                                  usernameController.text,
                                  phoneNumberController.text, 'user').then((
                                  value) {
                                Navigator.pushNamed(context, '/');
                                setState(() {
                                  usernameController.clear();
                                  emailController.clear();
                                  passwordController.clear();
                                  phoneNumberController.clear();
                                });
                              });
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Not Validated')));
                          }
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                    'Or create account using social media'
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: 35,
                      image: AssetImage('assets/images/fb.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      width: 35,
                      image: AssetImage('assets/images/instagram.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      width: 35,
                      image: AssetImage('assets/images/linkedin.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      width: 35,
                      image: AssetImage('assets/images/twitter.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/admin_login');
                  },
                  child: Text(
                    'Admin',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
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
