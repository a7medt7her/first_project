import 'package:flutter/material.dart';
import 'package:me/screens/homepage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});
  static const String routs = 'Login';
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  GlobalKey<FormState> emailstate = GlobalKey<FormState>();
  GlobalKey<FormState> passwordstate = GlobalKey<FormState>();
  TextEditingController emails = TextEditingController();
  TextEditingController passwords = TextEditingController();
  bool _ispaswordvisible = false;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      emails.text = args['email'] ?? '';
    }
    String? email = args?['email'];
    String? password = args?['password'];
    String? usernamee = args?['user-name'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/b.jpg', fit: BoxFit.cover),
          ),
          Column(
            children: [
              SizedBox(height: 100),
              Text(
                "Log In",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Card(
                  color: Colors.white,
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Form(
                    key: emailstate,
                    child: TextFieldTapRegion(
                      child: TextFormField(
                        controller: emails,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value)) {
                            return 'Enter a valid email address';
                          }
                          if (value != email) {
                            return 'Incorrect email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          labelText: 'E-mail',
                          hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 172, 170, 170),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Card(
                  color: Colors.white,
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Form(
                    key: passwordstate,
                    child: TextFieldTapRegion(
                      child: TextFormField(
                        controller: passwords,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value != password) {
                            return 'Incorrect password';
                          }
                          return null;
                        },
                        obscureText: !_ispaswordvisible,
                        decoration: InputDecoration(
                          hintText: "Enter your Password ",
                          labelText: 'Password',
                          hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 172, 170, 170),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _ispaswordvisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _ispaswordvisible = !_ispaswordvisible;
                              });
                            },
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // لون الظل
                          spreadRadius: 2, // قد إيه الظل يتمدد
                          blurRadius: 10, // درجة نعومة/تشويش الظل
                          offset: Offset(
                            1,
                            7,
                          ), // اتجاه الظل (x=يمين/شمال, y=فوق/تحت)
                        ),
                      ],

                      borderRadius: BorderRadius.circular(90),
                      border: Border.all(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 3,
                      ),
                    ),
                    child: Checkbox(
                      side: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 2,
                      ),
                      splashRadius: 16,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      value: _isChecked,
                      activeColor: const Color(0xFFF52AB6),
                      // لون المربع لما يتعلم عليه
                      checkColor: Color(0xFFF52AB6),
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Remember me",
                    style: TextStyle(
                      shadows: List.filled(
                        5,
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 0.9,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      fontSize: 15,
                      color: const Color.fromARGB(255, 253, 253, 253),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 150),
              Text(
                'Log In With Social Media',
                style: TextStyle(
                  shadows: List.filled(
                    5,
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 0.9,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  fontSize: 15,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(
                            255,
                            236,
                            235,
                            236,
                          ).withOpacity(0.2), // لون الظل
                          spreadRadius: 2, // قد إيه الظل يتمدد
                          blurRadius: 10, // درجة نعومة/تشويش الظل
                          offset: Offset(
                            1,
                            7,
                          ), // اتجاه الظل (x=يمين/شمال, y=فوق/تحت)
                        ),
                      ],
                      borderRadius: BorderRadius.circular(90),
                      border: Border.all(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 3,
                      ),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.only(right: 30, bottom: 30),
                      onPressed: () {},
                      icon: Icon(Icons.facebook, color: Colors.blue),
                      iconSize: 45,
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(
                            255,
                            221,
                            218,
                            218,
                          ).withOpacity(0.2), // لون الظل
                          spreadRadius: 2, // قد إيه الظل يتمدد
                          blurRadius: 10, // درجة نعومة/تشويش الظل
                          offset: Offset(
                            1,
                            7,
                          ), // اتجاه الظل (x=يمين/شمال, y=فوق/تحت)
                        ),
                      ],

                      borderRadius: BorderRadius.circular(90),
                      border: Border.all(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 3,
                      ),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.only(right: 30, bottom: 50),
                      onPressed: () {},
                      icon: Icon(Icons.g_mobiledata, color: Colors.red),
                      iconSize: 45,
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // لون الظل
                          spreadRadius: 2, // قد إيه الظل يتمدد
                          blurRadius: 10, // درجة نعومة/تشويش الظل
                          offset: Offset(
                            1,
                            7,
                          ), // اتجاه الظل (x=يمين/شمال, y=فوق/تحت)
                        ),
                      ],

                      borderRadius: BorderRadius.circular(90),
                      border: Border.all(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 3,
                      ),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.only(right: 30, bottom: 50),
                      onPressed: () {},
                      icon: Icon(Icons.apple, color: Colors.black),
                      iconSize: 45,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 6,
                  shadowColor: Colors.purple,
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  if (emailstate.currentState!.validate() &&
                      passwordstate.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      Homepage.routs,
                      arguments: {'username': usernamee, 'email': email},
                    );
                  }
                },
                child: Ink(
                  width: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 70, 2, 83),
                        Color.fromARGB(255, 165, 6, 99),
                        Color.fromARGB(255, 212, 6, 147),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(minWidth: 200, minHeight: 60),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Forgot Password?",
                style: TextStyle(
                  shadows: List.filled(
                    5,
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 0.9,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  fontSize: 15,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
