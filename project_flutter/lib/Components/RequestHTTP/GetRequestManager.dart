import 'package:http/http.dart';

Future<void> makeGetRequest(String requestFor) async {
  final String url = 'https://apitestforflutter.herokuapp.com/$requestFor';

  final Response response = await get(url);
  final int statusCode = response.statusCode;
  if (statusCode != 200) {
    print('Request Failed with status $statusCode');
   return;
  }
}
