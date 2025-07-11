// import 'package:flutter/material.dart';
// import 'package:karsome/screens/signin/sign_in_viewmodel.dart';
// import '../../app/routes.dart';
// // import 'package:flutter/rendering.dart';

// class SignIn extends StatefulWidget {
//   const SignIn({Key? key}) : super(key: key);
//   @override
//   State<SignIn> createState() => _SignInState();
// }

// SignInViewModel viewModel = SignInViewModel();

// class _SignInState extends State<SignIn> {
//   @override
//   bool pass_isHidden = true;
//   @override
//   Widget build(BuildContext context) {
//     String password = "";
//     String email = "";
//     final _formKey = GlobalKey<FormState>();

//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Container(
//                 alignment: Alignment.center,
//                 color: Color.fromARGB(255, 161, 4, 101),
//                 padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
//                 child: CircleAvatar(
//                   radius: 50,
//                   child: ClipOval(child: Image.asset('assets/images/cook.png')),
//                 ),
//               ),
//               Container(
//                 child: Stack(
//                   children: <Widget>[
//                     Container(
//                       alignment: Alignment.center,
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 30, horizontal: 0),
//                       child: const Text('Login',
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromARGB(255, 161, 4, 101),
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
//                 child: Column(children: <Widget>[
//                   TextFormField(
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email address';
//                         }
//                         return null;
//                       },
//                       onChanged: (value) {
//                         email = value;
//                       },
//                       decoration: InputDecoration(
//                           labelText: 'akhairy@cookbox.com',
//                           labelStyle: TextStyle(color: Colors.grey))),
//                   TextFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your password';
//                         }
//                         return null;
//                       },
//                       onChanged: (value) {
//                         password = value;
//                       },
//                       obscureText: pass_isHidden,
//                       decoration: InputDecoration(
//                           //!TODO password icon
//                           // suffixIcon: IconButton(
//                           //     onPressed: () {
//                           //       // setState(() {
//                           //       //   pass_isHidden = !pass_isHidden;
//                           //       // });
//                           //       _toggleVisibility();
//                           //     },
//                           //     icon: Icon(pass_isHidden
//                           //         ? Icons.visibility_off
//                           //         : Icons.visibility)),
//                           labelText: 'Enter password',
//                           labelStyle: TextStyle(color: Colors.grey)))
//                 ]),
//               ),
//               MouseRegion(
//                 cursor: SystemMouseCursors.click,
//                 child: Container(
//                     margin: const EdgeInsets.fromLTRB(30, 40, 30, 1),
//                     child: FloatingActionButton.extended(
//                       onPressed: () async {
//                         if (_formKey.currentState!.validate()) {
//                           //todo we need to use view model here with the method to register the user
//                           try {
//                             String status =
//                                 await viewModel.signIn(email, password);

//                             if (status == "Success") {
//                               String userType = await viewModel.getUserType();

//                               if (userType == 'customer') {
//                                 Navigator.pushReplacementNamed(
//                                     context, Routes.main_page);
//                               } else {
//                                 Navigator.pushReplacementNamed(
//                                     context, Routes.owner_mainpage);
//                               }
//                             } else {
//                               showDialog(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return AlertDialog(
//                                     title: Text('Error'),
//                                     actions: <Widget>[
//                                       ElevatedButton(
//                                         child: Text('Wrong email or password!'),
//                                         onPressed: () {
//                                           Navigator.pushReplacementNamed(
//                                               context, Routes.signIn);
//                                         },
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               );
//                             }
//                           } catch (e) {
//                             //will pass the e to show dialog and based on if user exist we display the following
//                           }
//                         }
//                       },
//                       label: const Text(
//                           style: TextStyle(color: Colors.white), 'Sign In'),
//                       backgroundColor: Color.fromARGB(255, 161, 4, 101),
//                     )),
//                 onHover: (event) => {SystemMouseCursors.disappearing},
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 0, horizontal: 35),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       TextButton(
//                           child: Text("Don't have an account?",
//                               style: TextStyle(
//                                 color: Color.fromARGB(255, 161, 4, 101),
//                               )),
//                           onPressed: () {
//                             Navigator.pushReplacementNamed(
//                                 context, Routes.register);
//                           }),
//                       TextButton(
//                         child: Text("Forgot Password?",
//                             textAlign: TextAlign.right,
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 161, 4, 101),
//                             )),
//                         onPressed: () {
//                           Navigator.pushNamed(context, '/reset');
//                         },
//                       ),
//                     ]),
//               ),
//               // Column(
//               //   children: <Widget>[
//               //     Container(
//               //         child: Text('or continue with'),
//               //         padding: EdgeInsets.fromLTRB(35, 10, 30, 15)),
//               //     OutlinedButton(
//               //         onPressed: () {},
//               //         child: Padding(
//               //             padding: EdgeInsets.symmetric(
//               //                 vertical: 10, horizontal: 20),
//               //             child: Wrap(
//               //               crossAxisAlignment: WrapCrossAlignment.center,
//               //               children: [
//               //                 Image.asset(
//               //                   'assets/images/google.png',
//               //                   width: 30,
//               //                   height: 30,
//               //                 ),
//               //                 Text('  Sign in with Google'),
//               //               ],
//               //             )),
//               //         style: OutlinedButton.styleFrom(
//               //           side: BorderSide(width: 3, color: Colors.blue),
//               //           shape: const RoundedRectangleBorder(
//               //               borderRadius:
//               //                   BorderRadius.all(Radius.circular(30))),
//               //         ))
//               //   ],
//               // ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _toggleVisibility() {
//     setState(() {
//       pass_isHidden = !pass_isHidden;
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:karsome/screens/signin/sign_in_viewmodel.dart';
import '../../app/routes.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

SignInViewModel viewModel = SignInViewModel();

class _SignInState extends State<SignIn> {
  bool pass_isHidden = true;

  @override
  Widget build(BuildContext context) {
    String password = "";
    String email = "";
    final formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Your UI components for login form
                Container(
                  alignment: Alignment.center,
                  color: const Color.fromARGB(255, 161, 4, 101),
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
                  child: CircleAvatar(
                    radius: 50,
                    child:
                        ClipOval(child: Image.asset('assets/images/cook.png')),
                  ),
                ),
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 0,
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 161, 4, 101),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 40,
                  ),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: const InputDecoration(
                            labelText: 'akhairy@cookbox.com',
                            labelStyle: TextStyle(color: Colors.grey)),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: pass_isHidden,
                        decoration: const InputDecoration(
                          labelText: 'Enter password',
                          labelStyle: TextStyle(color: Colors.grey),
                          //!TODO password icon
                          // suffixIcon: IconButton(
                          //     onPressed: () {
                          //       // setState(() {
                          //       //   pass_isHidden = !pass_isHidden;
                          //       // });
                          //       _toggleVisibility();
                          //     },
                          //     icon: Icon(pass_isHidden
                          //         ? Icons.visibility_off
                          //         : Icons.visibility)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          String status =
                              await viewModel.signIn(email, password);

                          if (status == "Success") {
                            String userType = await viewModel.getUserType();

                            if (userType == 'customer') {
                              Navigator.pushReplacementNamed(
                                  context, Routes.main_page);
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, Routes.owner_mainpage);
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content:
                                      const Text('Wrong email or password!'),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context); // Close dialog
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        } catch (e) {
                          // Handle specific error cases
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content: Text('An error occurred: $e'),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context); // Close dialog
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                    child: const Text('Sign In'),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        child: const Text("Don't have an account?",
                            style: TextStyle(
                              color: Color.fromARGB(255, 161, 4, 101),
                            )),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.register);
                        },
                      ),
                      TextButton(
                        child: const Text(
                          "Forgot Password?",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color.fromARGB(255, 161, 4, 101),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/reset');
                        },
                      ),
                    ],
                  ),
                ),
                // Additional UI components like forgot password, registration link, etc.
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
