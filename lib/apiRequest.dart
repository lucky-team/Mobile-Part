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

Future<PostsListI> insurancesGET(String url, String token) async {
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.headers.add('Authorization', 'Bearer '+token);
  HttpClientResponse response = await request.close();
  String reply = await response.transform(utf8.decoder).join();
  httpClient.close();
  // print(reply);
  return PostsListI.fromJson(json.decode(reply));
}

class PostsListI {
    final List<PostI> posts;
    PostsListI({
      this.posts,
    });

    factory PostsListI.fromJson(List<dynamic> parsedJson) {

    List<PostI> posts = new List<PostI>();
    posts = parsedJson.map((i)=>PostI.fromJson(i)).toList();

    return new PostsListI(
      posts: posts
    );
  }
}

class PostI{
  final String idI;
  final int plan,level,duration,age;
  final String startDate,expireDate,createdAt,updatedAt;
  final String insured_id, lastname,firstname,socialId,gender,phone,email,bankUserName,bankAccount,bankName;
  final Map<String,dynamic> insured;
  

  PostI({
    this.idI,this.plan,this.level,
    this.startDate,this.duration,this.expireDate,this.createdAt,this.updatedAt,
    this.insured_id,this.lastname,this.firstname,this.socialId,this.gender,this.age,
    this.phone,this.email,this.bankUserName,this.bankAccount,this.bankName,
    this.insured
  });

  factory PostI.fromJson(Map<String, dynamic> json){
    return new PostI(
      idI: json['_id'],
      plan: json['plan'],
      level: json['level'],

      startDate: json['startDate'],
      duration: json['duration'],
      expireDate: json['expireDate'],
      createdAt: json['insured.createdAt'],
      updatedAt: json['insured.updatedAt'],

      insured: json['insured'],

      // insured_id: json['insured._id'],
      // lastname: json['insured.lastname'],
      // firstname: json['insured.firstname'],
      // socialId: json['socialId'],
      // gender: json['insured.gender'],
      // age: json['insured.age'],

      // phone: json['insured.phone'],
      // email: json['insured.email'],
      // bankUserName: json['insured.bankUserName'],
      // bankAccount: json['insured.bankAccount'],
      // bankName: json['insured.bankName'],
    );
  }  
}



Future<PostsListC> claimsGET(String url, String token) async {
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.headers.add('Authorization', 'Bearer '+token);
  HttpClientResponse response = await request.close();
  String reply = await response.transform(utf8.decoder).join();
  httpClient.close();
  // print(reply);
  return PostsListC.fromJson(json.decode(reply));
}

class PostsListC {
    final List<PostC> posts;
    PostsListC({
      this.posts,
    });

    factory PostsListC.fromJson(List<dynamic> parsedJson) {

    List<PostC> posts = new List<PostC>();
    posts = parsedJson.map((i)=>PostC.fromJson(i)).toList();

    return new PostsListC(
      posts: posts
    );
  }
}


class PostC{
  final List files;
  final int type,amount;
  final String status;
  final String idC, location,date,reason,insurance,user,createdAt,updatedAt,employee,rejectReason;
  

  PostC({
    this.files,this.type,this.amount,
    this.status,
    this.idC,this.location,this.date,this.reason,
    this.insurance,this.user,this.createdAt,this.updatedAt,this.employee,this.rejectReason,
  });

  factory PostC.fromJson(Map<String, dynamic> json){
    return new PostC(
      files: json['files'],
      type: json['type'],
      amount: json['amount'],

      status: json['status'],

      idC: json['_id'],
      location: json['location'],
      date: json['date'],
      reason: json['reason'],

      insurance: json['insurance'],
      user: json['user'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      employee: json['employee'],
      rejectReason: json['rejectReason'],
    );
  }  
}
