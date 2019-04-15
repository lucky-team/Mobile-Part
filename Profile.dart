import 'package:flutter/material.dart';
import 'MainPage.dart';
import 'apiRequest.dart';
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}



                // print(profileM);

class _ProfilePageState extends State<ProfilePage> {
  
  @override
  Widget build(BuildContext context) {
    proGET = proGET.replaceAll('[', '');
    proGET = proGET.replaceAll(']', ''); 
    Map profileM = jsonDecode(proGET);
     return Scaffold(
         appBar: AppBar(
           leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
           title: Text('My Profile',textAlign:TextAlign.center,),
         ),

       body: ListView(
         children: <Widget>[
           SizedBox(height: 40.0,),
          
           Row(children: <Widget>[
             Text(' User ID :    ',style: TextStyle(fontSize: 20.0,color: Colors.blueGrey[500]),),
             Text(profileM['_id'],style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text(' Last Name:   ',style: TextStyle(fontSize: 20.0,color: Colors.blueGrey[500]),),
             Text(profileM['lastname'],style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text(' First Name:   ',style: TextStyle(fontSize: 20.0,color: Colors.blueGrey[500]),),
             Text(profileM['firstname'],style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text(' Social ID:   ',style: TextStyle(fontSize: 20.0,color: Colors.blueGrey[500]),),
             Text(profileM['socialId'],style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
              
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text(' Gender:      ',style: TextStyle(fontSize: 20.0,color: Colors.blueGrey[500]),),
             Text(profileM['gender'].toString().toUpperCase(),style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text(' Age:            ',style: TextStyle(fontSize: 20.0,color: Colors.blueGrey[500]),),
             Text(profileM['age'].toString(),style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
              
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text(' Country:     ',style: TextStyle(fontSize: 20.0,color: Colors.blueGrey[500]),),
             Text(profileM['country'],style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
              
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text(' Province:   ',style: TextStyle(fontSize: 20.0,color: Colors.blueGrey[500]),),
             Text(profileM['province'],style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
              
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text(' City:            ',style: TextStyle(fontSize: 20.0,color: Colors.blueGrey[500]),),
             Text(profileM['city'],style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
              
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text(' Phone:   ',style: TextStyle(fontSize: 20.0,color: Colors.blueGrey[500]),),
             Text(profileM['phone'],style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text(' E-mail:   ',style: TextStyle(fontSize: 20.0,color: Colors.blueGrey[500]),),
             Text(profileM['email'],style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
            
           ],),
         ],
       )
       
       );
  }
}