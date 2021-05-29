import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:lisiko_creative/services/auth.dart';
import 'package:lisiko_creative/widgets/auth_input_decoration.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // var result = Connection
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Image(
                  width: 100,
                  image: AssetImage('assets/images/one.png'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Lisiko Creative (PTY) Ltd',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Sign in to your account',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    letterSpacing: 2.3
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
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: authInputDecoration('Email Address', Icon(
                            Icons.person,
                            color: Colors.black,
                          )),
                          validator: (value) {
                            if (value.isEmpty) {
                                return 'Please enter your name';
                            } else if (!EmailValidator.validate(value)) {
                                return 'Invalid Email Address.';
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot your password?',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Sign in',
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
                          if(_formKey.currentState.validate()) {
                            dynamic result = await AuthService().login(emailController.text, passwordController.text);
                            if (result == null) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something went!!! Please try again.')));
                              print(result);
                            } else {
                              Navigator.pushNamed(context, '/');
                              print(result);
                            }
                          } else {
                          }
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Not Validated')));
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: 18
                        ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                          'Create',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          fontSize: 18
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
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
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
