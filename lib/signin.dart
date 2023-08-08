import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last/api/auth_service.dart';
import 'package:last/forgotpass.dart';
import 'package:last/my_home_page.dart';
import 'package:last/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/utils.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool _isError = false;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _email;
  String? _password;
  bool _rememberMe = false;
  void _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _rememberMe = prefs.getBool('rememberMe') ?? false;
      if (_rememberMe) {
        _email = prefs.getString('email') ?? '';
        _password = prefs.getString('password') ?? '';
      }
    });
  }

  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberMe', _rememberMe);
    if (_rememberMe) {
      prefs.setString('email', _email!);
      prefs.setString('password', _password!);
    } else {
      prefs.remove('email');
      prefs.remove('password');
    }
  }

  @override
  void initState() {
    _loadSavedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 80.0),

                          // Insert your logo or image here
                          Center(
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                image: const DecorationImage(
                                  image: AssetImage("assets/images/simo.png"),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 40),

                          const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Color(0xFFFF5400),
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          if (_isError)
                            Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 4, 20, 4),
                                  child: Row(children: const [
                                    Icon(
                                      CupertinoIcons.exclamationmark_triangle,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      "Veuillez verifier les données!",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ])),
                            ),
                          const SizedBox(height: 12),

                          TextFormField(
                            onChanged: (v) {
                              setState(() {
                                _email = v;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              prefixIcon: const Icon(Icons.email),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 16.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _email = value!;
                            },
                          ),

                          const SizedBox(height: 16.0),

                          TextFormField(
                            onChanged: (v) {
                              setState(() {
                                _password = v;
                              });
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              prefixIcon: const Icon(Icons.lock),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 16.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _password = value!;
                            },
                          ),

                          const SizedBox(height: 32.0),
                          CheckboxListTile(
                            title: const Text('Remember Me'),
                            value: _rememberMe,
                            onChanged: (bool? value) {
                              setState(() {
                                _rememberMe = value ?? false;
                              });
                            },
                          ),
                          const SizedBox(height: 16.0),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (!_isLoading) {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  //Utils.startLoading(context);
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    var response;
                                    try {
                                      response = await AuthService.signIn(
                                          _email!, _password!);
                                    } catch (e) {
                                      print(e);
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                    if (response != null) {
                                      _saveData();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        backgroundColor: Colors.green,
                                        behavior: SnackBarBehavior.floating,
                                        content: Text('Vous êtes connecté!'),
                                      ));
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      //Utils.stopLoading(context);
                                      // ignore: use_build_context_synchronously
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyHomePage(
                                                  role: response['role'])));
                                    } else {
                                      print("sometrhing worng");

                                      //Utils.startLoading(context);
                                      setState(() {
                                        _isError = true;
                                        _isLoading = false;
                                      });
                                    }
                                  }
                                  setState(() {
                                    _isLoading = false;
                                  });
                                } //Utils.stopLoading(context);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFFFF5400),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: BorderSide.none,
                                ),
                                elevation: 2.0,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: _isLoading ? 8.0 : 16.0),
                                child: _isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : const Text(
                                        'Sign In',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 19.0),

                          Center(
                            child: Container(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordScreen()))
                                },
                                child: const Text(
                                  "Mot De Passe Oublié?",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't  have an account?",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignUpScreen()));
                                },
                                child: const Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ])))));
  }
}
