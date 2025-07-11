import 'package:flutter/material.dart';
import '../../app/routes.dart';
import 'reset_password_viewmodel.dart';
// import 'package:flutter/rendering.dart';

//wil lask dr jumail how to turn it into stateless when handling back end later with mvvm
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

ResetPassViewModel viewModel = ResetPassViewModel();

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    String email = "";
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                color: const Color.fromRGBO(222, 2, 97, 0.608),
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 40),
                child: CircleAvatar(
                  radius: 50,
                  child: ClipOval(child: Image.asset('assets/images/cook.png')),
                ),
              ),
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 0),
                      child: const Text('Reset Password',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            // color: Color.fromRGBO(222, 2, 97, 0.608),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                child: Column(children: <Widget>[
                  TextFormField(
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
                          labelText: 'acafe@example.com',
                          labelStyle: TextStyle(color: Colors.grey))),
                ]),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                    margin: const EdgeInsets.fromLTRB(30, 40, 30, 1),
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          //todo we need to use view model here with the method to register the user
                          try {
                            if (await viewModel.resetPassword(email) != null) {
                              Navigator.pushReplacementNamed(
                                  context, Routes.signIn);
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Center(
                                        child: Text("Email doesn't exist")),
                                    actions: <Widget>[
                                      Center(
                                        child: ElevatedButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.pushReplacementNamed(
                                                context, Routes.reset);
                                          },
                                        ),
                                      )
                                    ],
                                  );
                                },
                              );
                            }
                          } catch (e) {
                            //will pass the e to show dialog and based on if user exist we display the following

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Something went wrong'),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      child: const Text("OK"),
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, Routes.signIn);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                      label: const Text('Reset Passsword'),
                      backgroundColor: const Color.fromRGBO(222, 2, 97, 0.608),
                    )),
                onHover: (event) => {SystemMouseCursors.disappearing},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
