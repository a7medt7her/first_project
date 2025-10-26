import 'package:flutter/material.dart';
import 'package:me/screens/Loginpage.dart';

class SighnInPage extends StatefulWidget {
  const SighnInPage({super.key});
  static const String routs = 'SighnUp';
  @override
  State<SighnInPage> createState() => _SighnInPageState();
}

class _SighnInPageState extends State<SighnInPage> {
  bool _isObscure = false;
  bool _passwordVisible = false;
  final GlobalKey<FormState> namestate = GlobalKey();
  final GlobalKey<FormState> passwordstate = GlobalKey();
  final GlobalKey<FormState> confirmpasswordstate = GlobalKey();
  final GlobalKey<FormState> emailstate = GlobalKey();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removed incorrect 'key' usage. To apply a theme, wrap with Theme widget if needed.
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/b.jpg', fit: BoxFit.cover),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                alignment: Alignment.center,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Form(
                    key: namestate,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username is required';
                        }
                        if (value.length < 3) {
                          return 'Username must be at least 3 characters long';
                        }
                        return null;
                      },
                      controller: username,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'UserName',
                        labelStyle: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 18,
                        ),
                        hintText: 'Enter your username',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 13,
                          horizontal: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        validator: (a) {
                          if (a == null || a.isEmpty) {
                            return 'Email is required';
                          }
                          if (!RegExp(
                            r"^[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$",
                          ).hasMatch(a)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                          ),
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  elevation: 6,
                  color: Colors.white,
                  shape: RoundedSuperellipseBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Form(
                    key: passwordstate,
                    child: TextFieldTapRegion(
                      child: TextFormField(
                        validator: (c) {
                          if (c == null || c.isEmpty) {
                            return 'Password is required';
                          }
                          if (c.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          if (!RegExp(
                            r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$',
                          ).hasMatch(c)) {
                            return 'Password must contain at least one letter and one number';
                          }
                          return null;
                        },
                        controller: password,
                        obscureText: !_isObscure,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  elevation: 6,
                  color: Colors.white,
                  shape: RoundedSuperellipseBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Form(
                    key: confirmpasswordstate,
                    child: TextFieldTapRegion(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != password.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 6,
                  shadowColor: Colors.purple,
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  if (namestate.currentState!.validate() &&
                      emailstate.currentState!.validate() &&
                      passwordstate.currentState!.validate() &&
                      confirmpasswordstate.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      Loginpage.routs,
                      arguments: {
                        'user-name': username.text,
                        'email': email.text,
                        'password': password.text,
                      },
                    );
                  }
                },
                child: Ink(
                  width: 250,
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
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
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
                      color: const Color.fromARGB(255, 184, 182, 182),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Loginpage.routs);
                    },
                    child: Text(
                      'LogIn',
                      style: TextStyle(
                        shadows: List.filled(
                          5,
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 0.9,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Or sign in with',
                style: TextStyle(
                  shadows: List.filled(
                    5,
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 0.9,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  color: const Color.fromARGB(255, 184, 182, 182),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: IconButton(
                      icon: Icon(Icons.g_mobiledata, color: Colors.red),
                      iconSize: 50,
                      onPressed: () {
                        // Handle Google sign-in
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 50,
                    height: 50,
                    child: IconButton(
                      icon: Icon(Icons.facebook, color: Colors.blue),
                      iconSize: 50,
                      onPressed: () {
                        // Handle Facebook sign-in
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 50,
                    height: 50,
                    child: IconButton(
                      icon: Icon(
                        Icons.apple,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      iconSize: 50,
                      onPressed: () {
                        // Handle Twitter sign-in
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
