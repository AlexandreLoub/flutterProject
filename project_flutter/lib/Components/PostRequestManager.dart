import 'package:http/http.dart';

void makePostRequest(String requestFor, String email, String password) async {
  String url = 'https://apitestforflutter.herokuapp.com/$requestFor';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"email": "$email", "password": "$password"}';
  Response response = await post(url, headers: headers, body: json);
  int statusCode = response.statusCode;
  String body = response.body;
  print('Request done body = $body with status $statusCode');

}