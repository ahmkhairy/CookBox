import 'package:flutter/material.dart';
import 'package:karsome/app/routes.dart';
import 'package:karsome/screens/customer/customer_support/customer_support_view_model.dart';

class CustomerSupoprtBody extends StatefulWidget {
  const CustomerSupoprtBody({super.key});

  @override
  State<CustomerSupoprtBody> createState() => _CustomerSupoprtBodyState();
}

class _CustomerSupoprtBodyState extends State<CustomerSupoprtBody> {
  @override
  Widget build(BuildContext context) {
    CustomerSupportModel emailModel = CustomerSupportModel();
    String userSubject = "";
    String message = "";
    String replyTo = "";
    String user = "";
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Image.asset(
                'assets/images/support.png',
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
                    child: const Text('Email support',
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
                      user = value;
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
                      replyTo = value;
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
                    height: 15,
                  ),
                  TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'email subject';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        userSubject = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.chat),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        hintText: 'Email Subject',
                      ),
                      keyboardType: TextInputType.text),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'tell us what issues are you having';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      message = value;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.help),
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'write a little something about the problem',
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(35, 30, 35, 1),
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await emailModel.sendEmail(
                          user: user,
                          replyto: replyTo,
                          usersubject: userSubject,
                          message: message);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                                'Email Sent!\nThank you for emailing us',
                                textAlign: TextAlign.center),
                            actions: <Widget>[
                              ElevatedButton(
                                child: const Center(
                                    child: Text('Back to Home Page')),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, Routes.main_page);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } catch (e) {
                      //will pass the e to show dialog and based on if user exist we display the following
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error: $e'),
                            actions: <Widget>[
                              ElevatedButton(
                                child:
                                    const Text('failed to send support email'),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.main_page);
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
                    backgroundColor: const Color.fromRGBO(222, 2, 97, 0.608)),
                child: const Text(
                  'Send email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
