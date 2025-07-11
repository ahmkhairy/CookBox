import 'package:flutter/material.dart';
import 'package:karsome/screens/main_page/widgets/search_textfield.dart';

class MainPageHeader extends StatelessWidget {
  const MainPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> greetingMsg() {
      int timeNow = DateTime.now().hour;
      String greeting = '';
      String msg = '';
      List<String> customMsg = [];

      if (timeNow < 12) {
        greeting = 'Good Morning!';
        msg = 'breakfast';
      } else if (timeNow > 16) {
        greeting = 'Good Evening!';
        msg = 'dinner';
      } else {
        greeting = 'Good Afternoon!';
        msg = 'lunch';
      }

      customMsg.add(greeting);
      customMsg.add(msg);

      return customMsg;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          greetingMsg()[0],
          style: const TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w800),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'it\'s time for ${greetingMsg()[1]}',
          style: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 15),
        ),
        const SizedBox(
          height: 10,
        ),
        const SearchTextField(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
