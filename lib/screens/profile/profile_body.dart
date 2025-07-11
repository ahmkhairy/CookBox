import 'package:flutter/material.dart';
import 'package:karsome/screens/profile/profile_viewmodel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool name_isEnabled = true;
  bool email_isEnabled = true;
  bool pass_isEnabled = true;
  bool phone_isEnabled = true;
  bool pass_invisible = true;

  ProfileViewModel viewModel = ProfileViewModel();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      margin: const EdgeInsets.all(40),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FutureBuilder<dynamic>(
              future: viewModel.getUserInfo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  dynamic userData = snapshot.data!;
                  return Container(
                    child: TextFormField(
                      readOnly: name_isEnabled,
                      initialValue: userData.fullName,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        labelStyle:
                            const TextStyle(color: Colors.blue, fontSize: 20),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              name_isEnabled = !name_isEnabled;
                            });
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder<dynamic>(
              future: viewModel.getUserInfo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  dynamic userData = snapshot.data!;
                  return Container(
                    child: TextFormField(
                      readOnly: pass_isEnabled,
                      // obscureText: true,
                      initialValue: '**********',
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle:
                              const TextStyle(color: Colors.blue, fontSize: 20),
                          border: const OutlineInputBorder(),
                          suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(
                                              builder: (context, setState) {
                                            return SingleChildScrollView(
                                                child: Dialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              elevation: 16,
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 40,
                                                        horizontal: 20),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: <Widget>[
                                                      const Text(
                                                        'Change Password',
                                                        style: TextStyle(
                                                            fontSize: 25),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      const SizedBox(
                                                        height: 30,
                                                      ),
                                                      TextFormField(
                                                        obscureText:
                                                            pass_invisible,
                                                        keyboardType:
                                                            TextInputType
                                                                .visiblePassword,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Enter Current Password',
                                                          labelStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .blue),
                                                          border:
                                                              const OutlineInputBorder(),
                                                          suffixIcon:
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      pass_invisible =
                                                                          !pass_invisible;
                                                                    });
                                                                  },
                                                                  icon: Icon(pass_invisible
                                                                      ? Icons
                                                                          .visibility_off
                                                                      : Icons
                                                                          .visibility)),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 30,
                                                      ),
                                                      TextFormField(
                                                        obscureText:
                                                            pass_invisible,
                                                        keyboardType:
                                                            TextInputType
                                                                .visiblePassword,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Enter New Password',
                                                          labelStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .blue),
                                                          border:
                                                              const OutlineInputBorder(),
                                                          suffixIcon:
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      pass_invisible =
                                                                          !pass_invisible;
                                                                    });
                                                                  },
                                                                  icon: Icon(pass_invisible
                                                                      ? Icons
                                                                          .visibility_off
                                                                      : Icons
                                                                          .visibility)),
                                                        ),
                                                      ),
                                                      Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 45, 0, 10),
                                                          child:
                                                              FloatingActionButton
                                                                  .extended(
                                                            elevation: 1.0,
                                                            onPressed: () {},
                                                            label: const Text(
                                                              'Change Password',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            backgroundColor:
                                                                const Color
                                                                    .fromRGBO(
                                                                    200,
                                                                    118,
                                                                    22,
                                                                    1),
                                                          )),
                                                      Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 10, 0, 10),
                                                          child: FloatingActionButton
                                                              .extended(
                                                                  elevation:
                                                                      3.0,
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  label: const Text(
                                                                      'Cancel'),
                                                                  backgroundColor:
                                                                      Colors.grey[
                                                                          400])),
                                                    ]),
                                              ),
                                            ));
                                          });
                                        });
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                              ])),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder<dynamic>(
              future: viewModel.getUserInfo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  dynamic userData = snapshot.data!;
                  return TextFormField(
                    readOnly: email_isEnabled,
                    initialValue: userData.email,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle:
                          const TextStyle(color: Colors.blue, fontSize: 20),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                    builder: (context, setState) {
                                  return SingleChildScrollView(
                                      child: Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    elevation: 16,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 40, horizontal: 20),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            const Text(
                                              'Change Email Address',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 25),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Please enter the valid email address',
                                              textAlign: TextAlign.center,
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            const Text(
                                              "We'll send a verification email to your new email address",
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            TextFormField(
                                              decoration: const InputDecoration(
                                                labelText:
                                                    'Enter New Email Address',
                                                labelStyle: TextStyle(
                                                    color: Colors.blue),
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 40, 0, 10),
                                                child: FloatingActionButton
                                                    .extended(
                                                  elevation: 1.0,
                                                  onPressed: () {},
                                                  label: const Text(
                                                    'Confirm Email Address',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  backgroundColor:
                                                      const Color.fromRGBO(
                                                          200, 118, 22, 1),
                                                )),
                                            Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 10, 0, 10),
                                                child: FloatingActionButton
                                                    .extended(
                                                        elevation: 3.0,
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        label: const Text(
                                                            'Cancel'),
                                                        backgroundColor:
                                                            Colors.grey[400])),
                                          ]),
                                    ),
                                  ));
                                });
                              });
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder<dynamic>(
              future: viewModel.getUserInfo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  dynamic userData = snapshot.data!;
                  return Container(
                    child: TextFormField(
                      readOnly: phone_isEnabled,
                      initialValue: userData.phoneNumber,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle:
                            const TextStyle(color: Colors.blue, fontSize: 20),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return SingleChildScrollView(
                                        child: Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 16,
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 40, horizontal: 20),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: <Widget>[
                                              const Text(
                                                'Change Phone Number',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 25),
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration:
                                                    const InputDecoration(
                                                  labelText:
                                                      'Enter New Phone Number',
                                                  labelStyle: TextStyle(
                                                      color: Colors.blue),
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 40,
                                              ),
                                              Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 40, 0, 10),
                                                  child: FloatingActionButton
                                                      .extended(
                                                    elevation: 1.0,
                                                    onPressed: () {},
                                                    label: const Text(
                                                      'Confirm Phone Number',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    backgroundColor:
                                                        const Color.fromRGBO(
                                                            200, 118, 22, 1),
                                                  )),
                                              Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 10, 0, 10),
                                                  child: FloatingActionButton
                                                      .extended(
                                                          elevation: 3.0,
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          label: const Text(
                                                              'Cancel'),
                                                          backgroundColor:
                                                              Colors
                                                                  .grey[400])),
                                            ]),
                                      ),
                                    ));
                                  });
                                });
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 90, 0, 10),
                child: FloatingActionButton.extended(
                    elevation: 3.0,
                    onPressed: () {},
                    label: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: const Color.fromRGBO(222, 2, 97, 0.608))),
          ]),
    ));
  }
}
