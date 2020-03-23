import 'package:http/http.dart';

Future<void> makePostRequest(String requestFor, String email, String password) async {
  final String url = 'https://apitestforflutter.herokuapp.com/$requestFor';
  final Map<String, String> headers = <String, String>{'Content-type': 'application/json'};
  final String json = '{"email": "$email", "password": "$password"}';
  final Response response = await post(url, headers: headers, body: json);
  final int statusCode = response.statusCode;
  final String body = response.body;
  print('Request done body = $body with status $statusCode');
}