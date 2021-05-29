import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:lisiko_creative/services/auth.dart';
import 'package:lisiko_creative/widgets/auth_input_decoration.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final _formKey = GlobalKey<FormState>();
  final passCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Image(
                  width: 50,
                  image: AssetImage('assets/images/one.png'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Lisiko Creative Admin',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
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
                      SizedBox(
                        height: 20,
                      ),
                      PhysicalModel(
                        color: Colors.white,
                        elevation: 20,
                        borderRadius: BorderRadius.circular(20),
                        child: TextFormField(
                          controller: passCodeController,
                          obscureText: true,
                          decoration: authInputDecoration('Pass code', Icon(
                            Icons.lock,
                            color: Colors.black,
                          )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your pass code';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
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
                          if(_formKey.currentState.validate() && passCodeController.text == 'Lisiko567890') {
                            dynamic result = await AuthService().login('lisikocreativemedia@gmail.com', 'LisikoCreative23');
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
