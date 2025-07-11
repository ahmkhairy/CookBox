import 'package:flutter/material.dart';
import 'package:karsome/app/routes.dart';
import '../register/register_viewmodel.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

//uncomment when registration view model is fixed
RegisterViewModel viewModel = RegisterViewModel();

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    String name = "";
    String password = "";
    String email = "";
    String phoneNo = "";
    final formKey = GlobalKey<FormState>();

    return Scaffold(
        body: Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppBar(
              backgroundColor: const Color.fromRGBO(222, 2, 97, 0.608),
              leading: GestureDetector(
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Image.asset(
                'assets/images/signUp.png',
                width: 250,
                height: 150,
              ),
            ),
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: const Text('Create an Account',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'Enter your fullname',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter an email address';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: 'Enter your email address',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      validator: (value) {
                        if (value == null ||
                            value.length < 8 ||
                            value.isEmpty) {
                          return 'Password should be minimum of 8 characters';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        hintText: 'Enter your password',
                      ),
                      keyboardType: TextInputType.visiblePassword),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a valid phone number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        phoneNo = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        hintText: 'Enter your phone number',
                      ),
                      keyboardType: TextInputType.number),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(35, 30, 35, 1),
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    //todo we need to use view model here with the method to register the user
                    try {
                      await viewModel.createUser(
                          name, email, password, phoneNo);
                      Navigator.pushReplacementNamed(context, Routes.signIn);
                    } catch (e) {
                      //will pass the e to show dialog and based on if user exist we display the following
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error: $e'),
                            actions: <Widget>[
                              ElevatedButton(
                                child: const Text('proceed to login'),
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.signIn);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                ),
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.fromLTRB(35, 10, 35, 0),
            //   child: OutlinedButton(
            //       onPressed: () {},
            //       child: Padding(
            //           padding:
            //               EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            //           child: Wrap(
            //             crossAxisAlignment: WrapCrossAlignment.center,
            //             children: [
            //               Image.asset(
            //                 'assets/images/google.png',
            //                 width: 30,
            //                 height: 30,
            //               ),
            //               Text('  Sign up with Google'),
            //             ],
            //           )),
            //       style: OutlinedButton.styleFrom(
            //         side: BorderSide(width: 3, color: Colors.blue),
            //         shape: const RoundedRectangleBorder(
            //             borderRadius: BorderRadius.all(Radius.circular(30))),
            //       )),
            // ),
            // Container(
            //   child: TextButton(
            //       child: Text("Already have an account?",
            //           style: TextStyle(
            //             color: Colors.blue,
            //           )),
            //       onPressed: () {
            //         Navigator.pushNamed(context, Routes.signIn);
            //       }),
            // ),
          ],
        ),
      ),
    ));
  }
}
