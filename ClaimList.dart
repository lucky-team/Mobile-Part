import 'dart:convert';

import 'package:Shrine/Claim.dart';

import 'package:flutter/material.dart';
import 'apiRequest.dart';
import 'login.dart';


int claimIndex;
PostC sigleDetail;
// String claimedID;

class ClaimListPage extends StatefulWidget {
  @override
  _ClaimListPageState createState() => _ClaimListPageState();
}

class _ClaimListPageState extends State<ClaimListPage> {
  @override
  Widget build(BuildContext context) {
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
          title: Text('My Claims',textAlign:TextAlign.center,)
        ),

      body: Center(
        
         child: FutureBuilder<PostsListC>(
           future: claimsGET('http://59.110.243.55:3000/claims',token0),

           builder: (context, snapshot) {
             if (snapshot.hasData) {
              List<PostC> yourPosts = snapshot.data.posts;
              return ListView.builder(
              itemCount: yourPosts.length,
                itemBuilder: (BuildContext context, int index) {





                  return GestureDetector(
                child: Column(
                children: <Widget>[
                  
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                    child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(''+yourPosts[index].idC,style: TextStyle(fontSize: 20.0),),
                        flex: 2,
                      ),
                      Expanded(
                        child: Text(' '+yourPosts[index].date.substring(0,10),style: TextStyle(fontSize: 25.0,color: Colors.blueGrey,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                        flex: 2,
                      ),
                      Expanded(
                        child: Text(yourPosts[index].status.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
                      flex: 1,
                      ),
                      ],
                  ),
                  ),
                  SizedBox(
                    height: 17.0,
                    child: Container(
                      // color: Colors.lightBlueAccent,
                      color: Colors.lightBlue[100],
                    ),
                  ),
                ],
                ),
                onTap: () {
                  claimIndex = index;
                  sigleDetail = yourPosts[index];
                  Navigator.push(context,MaterialPageRoute(
                        builder: (context) => ClaimDetailPage()
                      ));
                }
              );
              }
          );

               //return Text(snapshot.data.posts[1].name);
               } else if (snapshot.hasError) {
                 return Text("${snapshot.error}");
               }

                return CircularProgressIndicator();
               },
             ),
           ),




    );
  }
}



class ClaimDetailPage extends StatefulWidget {
  @override
  _ClaimDetailPageState createState() => _ClaimDetailPageState();
}

class _ClaimDetailPageState extends State<ClaimDetailPage> {
  @override
  Widget build(BuildContext context) {
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
           title: Text('Claim Details',textAlign:TextAlign.center,),
         ),


      body: Center(
          child: ListView(
            children: <Widget>[
           SizedBox(height: 40.0,),
           Row(children: <Widget>[
             Text(' Claim ID : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.idC,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 20.0,),
           Row(children: <Widget>[
             Text(' Type of the Insurance : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.type.toString(),style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 20.0,),
           Row(children: <Widget>[
             Text(' Location :      ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.location,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 20.0,),
           Row(children: <Widget>[
             Text(' Date : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.date.substring(0,10),style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 20.0,),
           Row(children: <Widget>[
             Text(' Claim Amount : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.amount.toString()+' €',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 20.0,),
           Row(children: <Widget>[
             Text(' Reason : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.reason,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 20.0,),
           Row(children: <Widget>[
             Text(' Insurance ID : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.insurance,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 20.0,),
           Row(children: <Widget>[
             Text(' User ID :          ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.user,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 20.0,),
          //  Row(children: <Widget>[
          //    Text(' Employee ID : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.employee,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
             
          //  ],),
          //  SizedBox(height: 20.0,),
          //  Row(children: <Widget>[
          //    Text(' Reject Reason : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.rejectReason,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
          //  ],),

           SizedBox(height: 20.0,),
           Row(children: <Widget>[
             Text(' Files : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.files.toString(),style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 70.0,),
           Row(children: <Widget>[
             Text(' Created At :  ',style: TextStyle(fontSize: 15.0,color: Colors.black54),),Text(sigleDetail.createdAt,style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.blueGrey[500]),),
             
           ],),
           SizedBox(height: 20.0,),
           Row(children: <Widget>[
             Text(' Updated At : ',style: TextStyle(fontSize: 15.0,color: Colors.black54),),Text(sigleDetail.updatedAt,style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.blueGrey[500]),),
             
           ],),

         ],
          ),
        ), 
    );
  }
}