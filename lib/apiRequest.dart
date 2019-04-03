import 'dart:convert';
import 'dart:io';
import 'dart:async';

main() async {
  String url =
      'http://59.110.243.55/users/login';
  Map map = {
    'data':{'username': 'user',
            'password': 'pwd',}
  };

  print(await apiRequest(url, map,''));
}

Future<String> apiRequest(String url, Map jsonMap,String token) async {
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.headers.add('Authorization', 'Bearer '+token);
  request.add(utf8.encode(json.encode(jsonMap)));
  HttpClientResponse response = await request.close();
  String reply = await response.transform(utf8.decoder).join();
  httpClient.close();
  // print(reply);
  return reply;
}

Future<String> apiRequestGET(String url, String token) async {
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.headers.add('Authorization', 'Bearer '+token);
  HttpClientResponse response = await request.close();
  String reply = await response.transform(utf8.decoder).join();
  httpClient.close();
  // print(reply);
  return reply;
}