import 'package:flutter/material.dart';
import 'package:karsome/app/routes.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: const Color.fromRGBO(222, 2, 97, 0.608),
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 30),
              child: CircleAvatar(
                radius: 50,
                child: ClipOval(child: Image.asset('assets/images/cook.png')),
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 0),
                child: const Text(
                  'Welcome to CookBox !',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      fontFamily: 'Lobster'),
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(35, 0, 35, 1),
                child: FloatingActionButton.extended(
                  heroTag: null,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signIn);
                  },
                  label: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: const Color.fromRGBO(222, 2, 97, 0.608),
                )),
            const SizedBox(
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(35, 10, 35, 90),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.register);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                        width: 3, color: Color.fromRGBO(222, 2, 97, 0.608)),
                    foregroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Text('Register Now'),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () async {},
                  icon: Image.asset(
                    'assets/images/facebook.png',
                  ),
                ),
                IconButton(
                  onPressed: () async {},
                  icon: Image.asset(
                    'assets/images/instagram.png',
                  ),
                ),
                IconButton(
                  onPressed: () async {},
                  icon: Image.asset('assets/images/twitter.png'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
