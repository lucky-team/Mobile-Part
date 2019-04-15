import 'dart:convert';

import 'package:Shrine/Claim.dart';

import 'package:flutter/material.dart';
import 'apiRequest.dart';
import 'login.dart';

// String insurances =  _GETinsurances().toString();
// String token22 = token0;
// Map maps =  jsonDecode(insurances);

// main(List<String> args) {
//   print(insurances);
// }
// jsonDecode(String re);

int insuranceIndex;
PostI sigleDetail;
String claimedID;

class InsurancePage extends StatefulWidget {
  @override
  _InsurancePageState createState() => _InsurancePageState();
}

class _InsurancePageState extends State<InsurancePage> {
  
  
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
           title: Text('My Insurances',textAlign:TextAlign.center,),
         ),

      // backgroundColor: Colors.blueGrey[100],
      body: Center(
        
         child: FutureBuilder<PostsListI>(
           future: insurancesGET('http://59.110.243.55:3000/insurances?',token0),

           builder: (context, snapshot) {
             if (snapshot.hasData) {
              List<PostI> yourPosts = snapshot.data.posts;
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
                        child: Text('Plan '+yourPosts[index].plan.toString()+'   Level '+yourPosts[index].level.toString(),style: TextStyle(fontSize: 22.0),),
                        flex: 2,
                      ),
                      Expanded(
                        child: Text('     '+yourPosts[index].insured['firstname']+' '+yourPosts[index].insured['lastname'],style: TextStyle(fontSize: 25.0,color: Colors.blueGrey,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                        flex: 2,
                      ),
                      Expanded(
                        child: Padding(
                        padding: EdgeInsets.fromLTRB(3.0, 0.0, 3.0, 0.0),
                        child: RaisedButton(
                          //padding: EdgeInsets.only(left: 3.0),
                        child: Text('Claim',style: TextStyle(color: Colors.white),),
                        elevation: 5.0,
                        // shape: BeveledRectangleBorder(
                        //   borderRadius: BorderRadius.all(Radius.circular(7.0)),
                        // ),
                        onPressed: (){
                          claimedID = yourPosts[index].idI;
                          Navigator.push(context,MaterialPageRoute(
                            builder: (context) => ClaimPage()
                          ));
                        },
                      )
                      ),
                      flex: 1,
                      ),
                      // Padding(
                      //   padding: EdgeInsets.fromLTRB(3.0, 0.0, 3.0, 0.0),
                      //   child: RaisedButton(
                      //     //padding: EdgeInsets.only(left: 3.0),
                      //   child: Text('Claim',style: TextStyle(color: Colors.white),),
                      //   elevation: 5.0,
                      //   // shape: BeveledRectangleBorder(
                      //   //   borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      //   // ),
                      //   onPressed: (){
                      //     claimedID = yourPosts[index].idI;
                      //     Navigator.push(context,MaterialPageRoute(
                      //       builder: (context) => ClaimPage()
                      //     ));
                      //   },
                      // )
                      // )
                      
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
                  insuranceIndex = index;
                  sigleDetail = yourPosts[index];
                  Navigator.push(context,MaterialPageRoute(
                        builder: (context) => InsuranceDetailPage()
                      ));
                }
              );
              }
          );

               //return Text(snapshot.data.posts[1].name);
               } else if (snapshot.hasError) {
                 return Text("${snapshot.error}");
               }
              // else if(!snapshot.hasData){
              //    return SizedBox(
              //       height: 17.0,
              //       child: Container(
              //         // color: Colors.lightBlueAccent,
              //         color: Colors.lightBlue[100],
              //       ),
              //     );
              //  }

               return CircularProgressIndicator();
               },
             ),
           ),

           
         
       );
  }
}



class InsuranceDetailPage extends StatefulWidget {
  @override
  _InsuranceDetailPageState createState() => _InsuranceDetailPageState();
}

class _InsuranceDetailPageState extends State<InsuranceDetailPage> {
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
           title: Text('Insurance Details',textAlign:TextAlign.center,),
         ),


      body: Center(
          child: ListView(
            children: <Widget>[
           SizedBox(height: 40.0,),
           Row(children: <Widget>[
             Text(' Insurance ID : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.idI,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 20.0,),
           Row(children: <Widget>[
             Text(' Insurance Plan & Level: ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text('Plan '+sigleDetail.plan.toString()+'   Level '+sigleDetail.level.toString(),style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 20.0,),
           Row(children: <Widget>[
             Text(' Start Date :      ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.startDate.substring(0,10),style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 20.0,),
           Row(children: <Widget>[
             Text(' Durantion : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.duration.toString()+'  Days',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 20.0,),
           Row(children: <Widget>[
             Text(' Expire Date : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.expireDate.substring(0,10),style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 20.0,),
           Row(children: <Widget>[
             Text(' Insured Person : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.insured['firstname']+' '+sigleDetail.insured['lastname'],style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           
           SizedBox(height: 50.0,),
           Row(children: <Widget>[
             Icon(Icons.account_circle,size: 30.0,),
             Text(' Insured Person Information: ',style: TextStyle(fontSize: 18.0,color: Colors.black54,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
              
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text('    ID : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.insured['_id'],style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text('    First Name : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.insured['firstname'],style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             Text('    Last Name : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.insured['lastname'],style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text('    Social ID : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.insured['socialId'],style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text('    Gender :    ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.insured['gender'].toString().toUpperCase(),style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text('    Age :          ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.insured['age'].toString(),style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text('    Phone Number :   ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.insured['phone'].toString(),style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text('    E-mail Address :   ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.insured['email'],style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 20.0,),
           Row(children: <Widget>[
             Text('    Name of Bank :        ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.insured['bankName'],style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text('    Account of Bank :    ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.insured['bankAccount'],style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 10.0,),
           Row(children: <Widget>[
             Text('    Username of Bank : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.insured['bankUsername'],style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 50.0,),
           Row(children: <Widget>[
             Text('Created At :  ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.insured['createdAt'].toString().substring(0,10)+' '+sigleDetail.insured['createdAt'].toString().substring(11,19),style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
           SizedBox(height: 15.0,),
           Row(children: <Widget>[
             Text('Updated At : ',style: TextStyle(fontSize: 18.0,color: Colors.black54),),Text(sigleDetail.insured['updatedAt'].toString().substring(0,10)+' '+sigleDetail.insured['updatedAt'].toString().substring(11,19),style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
             
           ],),
         ],
          ),
        ), 
         
       );
  }
}