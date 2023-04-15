import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/home_model.dart';
import '../provider/Random_provider.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Randomprovider? RandomproviderFalse;
  Randomprovider? RandomproviderTrue;

  @override
  Widget build(BuildContext context) {
    RandomproviderFalse = Provider.of(context, listen: false);
    RandomproviderTrue = Provider.of(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Random User",style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,centerTitle: true),
        body: Center(
          child: FutureBuilder(
            future: RandomproviderFalse!.findRandomPerson(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                print("${RandomproviderTrue!.index}");
                RandomPerson? randomPerson = snapshot.data;
                List<Result>? resultList = randomPerson!.results;
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.all(8),
                      padding: EdgeInsetsDirectional.all(8),
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20),
                          gradient: LinearGradient(colors: [
                            Colors.white,
                            Colors.white,
                          ]),
                          border: Border.all(color: Colors.black, width: 2),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 5,
                                offset: Offset(9, 9),
                                spreadRadius: 1.5),
                          ]),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsetsDirectional.all(10),
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.black, width: 2),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadiusDirectional.circular(100),
                              child: Image.network("${resultList![0].picture!.large}",fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${resultList[0].name!.title}. ${resultList[0].name!.first} ${resultList[0].name!.last}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "From ${resultList[0].location!.country}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${resultList[0].location!.street!.number}, ${resultList[0].location!.street!.name}, ${resultList[0].location!.city}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        "${resultList[0].location!.state}, ${resultList[0].location!.country} , - ${resultList[0].location!.postcode}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.email_outlined,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${resultList[0].email}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${resultList[0].phone}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.telegram,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${resultList[0].cell}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 28,),
                    InkWell(onTap: () {
                      RandomproviderFalse!.changeIndex();
                    },child: Container(
                      height: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Colors.black),
                        child: Icon(Icons.refresh,color: Colors.white,size: 45))),
                  ],
                );
              }
              return CircularProgressIndicator(color: Colors.black,);
            },
          ),
        ),
      ),
    );
  }
}
