import 'dart:convert';

import 'package:map_mvvm/map_mvvm.dart';

import 'package:http/http.dart' as http;

class CustomerSupportModel extends Viewmodel {
  Future sendEmail({
    required String user,
    required String replyto,
    required String usersubject,
    required String message,
  }) async {
    const serviceId = 'service_ozgo5qi';
    const templateId = 'template_er3s37d';
    const userId = 'GQwv_poeZUC0plVBp';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user': user,
          'reply_to': replyto,
          'user_subject': usersubject,
          'message': message,
        },
      }),
    );
    print('this is what we got when email is being sent${response.body}');
  }
}
